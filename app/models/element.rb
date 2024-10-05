class Element < ApplicationRecord
  has_many :ionization_energies, dependent: :destroy
  has_many :shells, dependent: :destroy
  has_one :order, dependent: :destroy

  def as_json(_options = {})
    {
      id: id,
      name: name,
      appearance: appearance,
      atomic_mass: atomic_mass,
      boil: boil,
      category: category,
      color: color,
      density: density,
      discovered_by: discovered_by,
      melt: melt,
      molar_heat: molar_heat,
      named_by: named_by,
      number: number,
      period: period,
      phase: phase,
      source: source,
      spectral_img: spectral_img,
      summary: summary,
      symbol: symbol,
      xpos: xpos,
      ypos: ypos,
      shells: shells.pluck(:number),
      electron_configuration: electron_configuration,
      electron_configuration_semantic: electron_configuration_semantic,
      electron_affinity: electron_affinity,
      electronegativity_pauling: electronegativity_pauling,
      ionization_energies: ionization_energies.pluck(:value)
    }
  end
end
