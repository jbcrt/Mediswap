class Profile < ApplicationRecord
    belongs_to :user
    has_one_attached :avatar

    attr_readonly :profession
    attr_accessor :remove_avatar

    enum title: {
        mister: "Mister",
        madam: "Madam"
    }

    validates :title, presence: true, inclusion: { in: Profile.titles.keys }
    validates :first_name, presence: true, format: { with: /\A^[a-zA-ZÀ-ÿ-.' ]*$\z/ }
    validates :last_name, presence: true, format: { with: /\A^[a-zA-ZÀ-ÿ-.' ]*$\z/ }
    validates :profession, presence: true, inclusion: { in: PROFESSIONS }
    validates :professional_id_number, presence: true, numericality: { only_integer: true }, length: { in: 9..11 }

    after_save :purge_avatar, if: :remove_avatar

    private
    
    def purge_avatar
        avatar.purge
    end
end
