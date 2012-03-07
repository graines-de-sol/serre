class Notifier < ActionMailer::Base

  def mail_message(datas)
    @datas = datas

    mail(
      :from    => "la-cordee@refuge.la-cordee.net",
      :to      => @datas[:to],
      :subject => @datas[:subject]
    )
  end

end

