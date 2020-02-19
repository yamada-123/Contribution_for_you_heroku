FactoryBot.define do
  factory :first_labelling_supply,class: LabellingSupply do
    supply_id { Supply.first.id }
    label_id {  Label.first.id }
  end

  factory :second_labelling_supply,class: LabellingSupply do
    supply_id { Supply.last.id }
    label_id { Label.last.id}
  end
end
