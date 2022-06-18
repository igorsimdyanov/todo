# frozen_string_literal: true

namespace :aasm_diagram do
  desc 'Генерация png-диаграммы для модели TrafficLight'
  task traffic_light: :environment do
    AASMDiagram::Diagram.new(TrafficLight.new.aasm, 'tmp/traffic_light.png')
    puts 'Диаграмма создана по пути tmp/traffic_light.png'
  end
end
