class Sale < Offer
    belongs_to :user

    enum contract_type: { 
        cession_local: "Cession de local",
        cession_patientele: "Cession de patientèle",
        location_local: "Location de local"
    }
end