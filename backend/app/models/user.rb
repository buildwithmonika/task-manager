class User < ApplicationRecord
    before_save :downcase_email
    has_secure_password
    validates :name, presence: true, length: { maximum:  100}
    validates :email, presence: true, length: { maximum: 255 },
                uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }

    has_many :tasks, dependent: :destroy

    private

    def downcase_email
      self.email = email.downcase if email.present?
    end
end
