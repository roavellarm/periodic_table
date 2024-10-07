namespace :import do
  desc "Import periodic table data from json"
  task :data, [ :file ] => :environment do |t, args|
    return puts "rails import:data[file_path] required" unless args[:file]
    puts "Importing file #{args[:file]}"

    # Reads the file path and checks if the file exists
    file_path = args[:file]
    return puts "File not found: #{file_path}" unless File.exist?(file_path)

    puts "Importing file #{file_path}"

    # Reads and parse the JSON file
    begin
      file = File.read(file_path)
      data = JSON.parse(file)
    rescue JSON::ParserError => e
      puts "Error parsing JSON: #{e.message}"
      return
    end

    # Starts the import process
    ActiveRecord::Base.transaction do
      data["order"].each do |element_symbol|
        element_data = data[element_symbol]

        # Creates or updates the element
        element = Element.find_or_create_by!(symbol: element_data["symbol"]) do |el|
          el.name = element_data["name"]
          el.appearance = element_data["appearance"]
          el.atomic_mass = element_data["atomic_mass"]
          el.boil = element_data["boil"]
          el.category = element_data["category"]
          el.color = element_data["color"]
          el.density = element_data["density"]
          el.discovered_by = element_data["discovered_by"]
          el.melt = element_data["melt"]
          el.molar_heat = element_data["molar_heat"]
          el.named_by = element_data["named_by"]
          el.number = element_data["number"]
          el.period = element_data["period"]
          el.phase = element_data["phase"]
          el.source = element_data["source"]
          el.spectral_img = element_data["spectral_img"]
          el.summary = element_data["summary"]
          el.xpos = element_data["xpos"]
          el.ypos = element_data["ypos"]
          el.electron_configuration = element_data["electron_configuration"]
          el.electron_configuration_semantic = element_data["electron_configuration_semantic"]
          el.electron_affinity = element_data["electron_affinity"]
          el.electronegativity_pauling = element_data["electronegativity_pauling"]
        end

        element_data["ionization_energies"]&.each do |energy|
          IonizationEnergy.create!(element: element, value: energy)
        end

        element_data["shells"]&.each do |shell|
          Shell.create!(element: element, number: shell)
        end

        Order.find_or_create_by!(element: element)
      end
    end
  end
end
