module NewsletterHelper

  # Format newsletter archives label
  def label_for_newsletters_archives(newsletter)
    if newsletter.sent_on
      "#{newsletter.title} (#{t('newsletter.sent_on')} #{l(newsletter.sent_on)})"
    else
      if newsletter.title
        "#{newsletter.title} (#{t('newsletter.not_sent')})"
      else
        "#{t('newsletter.new')}"
      end
    end
  end
end

