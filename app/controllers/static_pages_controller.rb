# frozen_string_literal: true

# Controller for client static page
class StaticPagesController < ApplicationController
  before_action :set_category, only: :show_category

  def home
    @posts = Post.published.order(id: :desc).page(params[:page]).per(5)
    # filter_posts(published_posts)
  end

  def show_category
    published_posts = @category.posts.published
    filter_posts(published_posts)
  end

  def about
    @skills = [
      {
        name:       'Java (Android)',
        percentage: 50,
        color:      '#c0392b'
      },
      {
        name:       'Ruby (Rails)',
        percentage: 80,
        color:      '#1199ff'
      },
      {
        name:       'PHP (Laravel)',
        percentage: 20,
        color:      '#9b59b6'
      },
      {
        name:       'Javascript',
        percentage: 60,
        color:      '#ffa500'
      },
      {
        name:       'HTML/CSS',
        percentage: 50,
        color:      '#27ae60'
      }
    ]
    @job_timelines = [
      {
        timestamp: '3/2018 - Hiện tại',
        title:     'GA Technologies Inc - Rails Developer',
        content:   'Hiện tại mình đang làm việc tại GA Technologies, Nhật Bản. Công ty chuyên về bất động sản.' \
              'Tuy không phải chuyên về IT, không có quy trình chuẩn như các công ty khác, nhưng hiện tại cũng đang phát triển mạnh về mảng này.' \
              'Ngoài điểm ý ra thì không còn gì để chê, môi trường làm việc trẻ, mọi người đều thân thiện, đặc biệt mỗi tháng có party nhỏ' \
              'để nhân viên làm quen với nhau, giúp tiếng Nhật của mình lên không ít 😁.'

      },
      {
        timestamp: '4/2016 - 12/2016',
        title:     'FRAMGIA VIETNAM CO., LTD - Android Developer Internship',
        content:   'Trong khoảng thời gian này có lẽ mình học được nhiều nhất, không phải kiến thức về các ngôn ngữ lập trình, mà là' \
              'cách làm việc nhóm, cách quản lý, phân chia công việc, cách sử dụng Git hiệu quả... Đặc biệt mình còn làm quen được với 1' \
              'team ( iship4` à nhầm ishipper 🤣 ) thực sự hợp cạ, phải nói là đi làm mà chưa bao giờ thấy chán.'
      }
    ]
    @education_timelines = [
      {
        timestamp: '9/2012 - 7/2017',
        title:     'Ha Noi University of Science and Technology',
        content:   '5 năm đại học tưởng dài nhưng thực sự qua rất nhanh. Lúc học thì muốn xong nhanh để ra trường đi làm.
                  Đến lúc đi làm rồi thì lại thấy...ờ ra trường nhanh đúng là vui thật 😇.'

      },
      {
        timestamp: '9/2009 - 4/2012',
        title:     'High School for Gifted Student',
        content:   'Mặc dù học chuyên Tin từ cấp 3, nhưng hồi ý mình cũng không biết nhiều về lập trình ngoài 1 ít Pascal và C.
                  Giờ nghĩ lại thời ý mà chăm chỉ thì giờ chắc bá lắm r.'
      }
    ]
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def filter_posts(published_posts)
    @posts = if params[:last_post_id]
               published_posts.where('id < ?', params[:last_post_id]).order(id: :desc)
             else
               published_posts.order(id: :desc)
             end
    @posts = @posts.limit(POST_LIMIT)
    @load_done = !published_posts.exists?(['id < ?', @posts.last&.id])
    respond_to do |format|
      format.html
      format.js {render 'load_more.js.erb', locals: {posts: @posts, load_done: @load_done}}
    end
  end
end
