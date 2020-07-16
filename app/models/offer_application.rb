class OfferApplication < ApplicationRecord
    belongs_to :user
    belongs_to :applicable, polymorphic: true

    before_validation :application_sent, on: :create

    enum status: {
        sent: "Envoyée",
        accepted: "Acceptée",
        rejected: "Rejetée"
    }

    validates :status, inclusion: { in: OfferApplication.statuses.keys }
    validates :application_text, length: { in: 1..2500 }

    private

    def application_sent
        self.status = "sent"
    end
end
