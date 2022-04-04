namespace :aasm_diagram do
  desc 'Генерация png-диаграммы для модели TrafficLight'
  task traffic_light: :environment do
    AASMDiagram::Diagram.new(TrafficLight.new.aasm, 'tmp/traffic_light.png')
    puts 'Диаграмма создана по пути tmp/traffic_light.png'
  end

  desc 'Генерация png-диаграммы для модели Event'
  task event: :environment do
    AASMDiagram::Diagram.new(Event.new.aasm, 'tmp/event.png')
    puts 'Диаграмма создана по пути tmp/event.png'
  end

  desc 'Генерация png-диаграммы для модели User'
  task user: :environment do
    AASMDiagram::Diagram.new(User.new.aasm, 'tmp/user.png')
    puts 'Диаграмма создана по пути tmp/user.png'
  end
end
