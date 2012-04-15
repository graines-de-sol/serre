class Notifier < ActionMailer::Base

  def mail_message(datas)
    @datas = datas

    mail(
      :from    => "la-cordee@refuge.la-cordee.net",
      :to      => @datas[:to],
      :subject => @datas[:subject]
    )
  end

  def welcome_message(datas)
    @datas = datas
    mail(
      :from    => "la-cordee@refuge.la-cordee.net",
      :to      => @datas[:to],
      :subject => $conf.welcome_mail_subject,
      :body    => @datas[:body]) do |format|
        format.html
    end

  end


end

