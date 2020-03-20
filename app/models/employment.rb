class Employment < Offer
    belongs_to :user

    enum contract_type: { 
        contrat_assitant_hopitaux: "Assistant des hopitaux",
        contrat_duree_determinee: "Contrat à durée déterminée",
        contrat_duree_indeterminee: "Contrat à durée indéterminée",
        contrat_clinicien_hospitalier: "Clinicien hospitalier",
        contrat_exercice_liberal: "Exercice à titre libéral",
        contrat_assitant_hopitaux: "Praticien attaché",
        contrat_praticien_hospitalier_contractuel: "Praticien hospitalier contractuel",
    }

end