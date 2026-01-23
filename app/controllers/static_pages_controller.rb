# frozen_string_literal: true

# Controller for client static page
class StaticPagesController < ApplicationController
  before_action :set_category, only: :show_category
  before_action :set_popular_posts, only: %i[home show_category]

  def home
    @posts = Post.published.order(id: :desc).page(params[:page])
  end

  def show_category
    @posts = @category.posts.published.order(id: :desc).page(params[:page])
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
        period:       '3/2018 - Present',
        title:        'Rails Developer',
        organization: 'GA Technologies Inc, Japan',
        description:  'Working on real estate tech products with Ruby on Rails. Great work environment with friendly colleagues.'
      },
      {
        period:       '4/2016 - 12/2016',
        title:        'Android Developer Intern',
        organization: 'FRAMGIA VIETNAM CO., LTD',
        description:  'Learned teamwork, project management, Git workflows. An invaluable experience with amazing teammates.'
      }
    ]
    @education_timelines = [
      {
        period:       '9/2012 - 7/2017',
        title:        'Bachelor in Information Technology',
        organization: 'Ha Noi University of Science and Technology',
        description:  '5 years of university flew by quickly. Great foundation in computer science fundamentals.'
      },
      {
        period:       '9/2009 - 4/2012',
        title:        'Computer Science Major',
        organization: 'High School for Gifted Students',
        description:  'Early exposure to programming with Pascal and C. Wish I had been more diligent back then!'
      }
    ]
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_popular_posts
    @popular_posts = Post.published.order(clap_count: :desc).limit(3)
  end
end
