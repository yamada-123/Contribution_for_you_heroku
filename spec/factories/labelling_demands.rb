FactoryBot.define do

  factory :first_labelling_demand,class: LabellingDemand do
    demand_id { Demand.first.id }
    label_id {  Label.first.id }
  end

  factory :second_labelling_demand,class: LabellingDemand do
    demand_id { Demand.last.id }
    label_id { Label.last.id}
  end
end