class Story < ApplicationRecord
  # 引用套件
  include AASM
  extend FriendlyId

  friendly_id :slug_candidate, use: :slugged

  # validations
  validates :title,presence: true

  # relationships 
  belongs_to :user
  has_one_attached :cover_image

  # scope
  default_scope { where(deleted_at: nil)}

  # instance methods
  def destroy
    update(deleted_at: Time.now)
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  aasm(column: 'status', no_direct_assignment: true) do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
      after do
        puts "發簡訊通知"
      end
    end
    event :unpublish do
      transitions from: :published, to: :draft
    end
  end

 
  
  private

  def slug_candidate
    [
      :title,
      [:title, SecureRandom.hex[0,8]]
    ]
  end

end

