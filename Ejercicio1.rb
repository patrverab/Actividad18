#

# Mesa 1, 90, 60, 10, 30
# Mesa 2, 40, 34, 77, 11
# Mesa 3, 34, 86, 55, 91
# Mesa 4, 67, 93, 43, 87
#
# Se pide:

# Crear una clase Table cuyo constructor reciba el nombre de la mesa y las recaudaciones correspondientes de cada día.

class Table
  attr_reader :mesa, :recaudaciones
  def initialize(mesa, *recaudaciones)
     @mesa = mesa
     @recaudaciones = recaudaciones.map(&:to_i)
   end
   def self.build(file)
     tables = []
     File.readlines(file).each do |line|
     table_info_array = line.chomp.split(', ')
     mesa = table_info_array.shift
     recaudaciones = table_info_array
     tables << Table.new(mesa, *recaudaciones)
     end
     return tables
   end

   def Table.max_profit(file)
     tables = build(file)
     best_results = {}
     tables.each_with_index do |table, day|
     best_results[table.mesa] = [table.max, table.max_day]
    end
    best_results
  end

   def Table.avg_profit; end

   def max
     recaudaciones.max
   end
   def max_day
     recaudaciones.index(max) + 1
 end
end
# arreglo = Table.build('casino.txt')
# puts arreglo[0]
print Table.max_profit('casino.txt')

# def self.build(filename)
#   file = File.open(filename, 'r')
#   data =  file.readlines.map(&:chomp)
#   file.close
#   list = []
#   data.each do |line|
#     ls = line.split(', ')
#     list << Table.new(*ls)
#   end
#   list
# end
# puts Table.build('casino.txt')






# def scanner(filename, word)
#   file = File.open(filename, 'r')
#   data = file.readlines.map(&:chomp)
#   file.close
#   # print data
#   data.include?(word)
# end
#
# products_list = []
# data = []
# File.open('catalogo.txt', 'r') { |file| data = file.readlines}
# data.each do |prod|
#   ls = prod.split(', ')
#   products_list << Product.new(*ls)
# end
# puts products_list





#
# Hint: El constructor debe recibir 5 argumentos. Uno para el nombre de la mesa y los demás para cada recaudación correspondiente a esa mesa.
#
# Crear un método que permita leer el archivo e instanciar un objeto de la clase Table por cada línea del archivo.
#
# Crear métodos que permitan:
#
# Conocer el mayor valor recaudado, por mesa, y el nombre de la mesa y día corresponde (día 1, día 2, día 3 o día 4).
#
# Calcular el promedio total de lo recaudado por todas las mesas en todos los días.
