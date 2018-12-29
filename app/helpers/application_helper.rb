# frozen_string_literal: true

module ApplicationHelper
  class MarkdownRenderer < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end

    IGNORED_PARENT_NAMES = %w[code pre].freeze

    def emojify(document)
      doc = Nokogiri::HTML::DocumentFragment.parse(document)
      doc.search('.//text()').each do |node|
        next if node.parent.name.in?(IGNORED_PARENT_NAMES)

        node.replace(node_with_emoji(node.content))
      end
      doc.to_html
    end

    def node_with_emoji(content)
      prefix_src = 'https://cdnjs.cloudflare.com/ajax/libs/emojione/2.2.7/assets/png/'
      Somemoji.emoji_one_emoji_collection.replace_code(content) do |emoji|
        %(<img class="emoji-icon" src="#{prefix_src}#{emoji.code_points.join('-')}.png">)
      end
    end

    def postprocess(document)
      emojify(document)
    end
  end

  def markdown(text)
    rndr = MarkdownRenderer.new(hard_wrap: true)
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis:  true,
      autolink:           true,
      strikethrough:      true,
      lax_html_blocks:    true,
      superscript:        true,
      tables:             true
    }
    markdown_to_html = Redcarpet::Markdown.new(rndr, options)
    markdown_to_html.render(text).html_safe
  end
end
