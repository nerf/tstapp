object @company

attributes *Company.column_names

child :owners do
  attributes *Owner.column_names
end
