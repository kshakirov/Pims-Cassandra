require_relative 'tools_helper'

cql = %Q(Insert into   attributes  (code, attribute_set, label, options) values
        (
            'manufacturer',
            'default',
            'Manufacturer',
            ['Turbo International', 'Garret', 'KKK', 'Mitsubishi'])
)
execute cql

cql = %Q(Insert into   attributes  (code, attribute_set, label, options) values
        (
            'part',
            'default',
            'Part Tupe',
            ['Compressor', 'Cartridge', 'Turbine Wheel', 'Piston Ring', 'Bearing Spacer'])
)

execute cql