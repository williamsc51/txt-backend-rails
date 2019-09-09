class Api::V1::UserResource < JSONAPI::Resource
  attributes :fname, :lname, :email, :password
  after_save :new_user_mailer, on: :create
  has_many :books
  has_one :cart

  def fetchable_fields
      super - [:password]
  end

  def new_user_mailer
    UserMailer.with(user: @model).welcome_email.deliver_now
  end

end
