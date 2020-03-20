class Collaboration < Offer
    belongs_to :user

    enum contract_type: { 
        assistanat: "Assistanat",
        association: "Association",
        collaboration: "Collaboration"
    }
end