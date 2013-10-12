# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding the database..."


# Resets the seeds for static tables
Level.delete_all
Item.delete_all
ItemPrefix.delete_all
ItemSuffix.delete_all

puts "Adding base items to the database..."

# == Schema Information
#
# Table name: items
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  is_equippable          :boolean
#  min_equip_player_level :integer
#  equip_slot             :integer
#  uses_ammo              :boolean
#  ammo_type              :integer
#  is_consumable          :boolean
#  is_currency            :boolean
#  is_set                 :boolean
#  set_id                 :integer
#  set_item_number        :integer
#  value                  :integer
#  is_unique              :boolean
#  can_have_prefix        :boolean
#  can_have_suffix        :boolean
#  attack_min             :integer
#  attack_max             :integer
#  defense_min            :integer
#  defense_max            :integer
#  stealth_min            :integer
#  stealth_max            :integer
#  luck_min               :integer
#  luck_max               :integer
#  flavor_text            :text
#

# EQUIP SLOTS
#Head    1
#Body    2
#Legs    3
#Feet    4
#Weapon  5
#Defense Item  6
#Ammo    7


  lambda {
    item = Item.new
    item.id = 10001
    item.name = "Gold"
    item.is_consumable = true
    item.is_currency = true
    item.value = 1
    item.can_have_prefix = false
    item.can_have_suffix = false
    item.flavor_text = "Plain old currency"
    item.save!

    item = Item.new
    item.id = 10002
    item.name = "Test Hoodie"
    item.min_equip_player_level = 1
    item.equip_slot = 2
    item.is_set = true  
    item.set_item_number = 1
    item.value = 1000
    item.can_have_prefix = true
    item.can_have_suffix = true
    item.defense_min = 1
    item.defense_max = 100
    item.stealth_min = 1
    item.stealth_max = 100
    item.luck_min = 1
    item.luck_max = 100
    item.flavor_text = "Gold jacket, green jacket, who gives a shit?"
    item.save!

  }.call



# == Schema Information
#
# Table name: item_prefixes
#
#  id           :integer          not null, primary key
#  base_item_id :integer
#  name         :string(255)
#  attack_mod   :integer
#  defense_mod  :integer
#  stealth_mod  :integer
#  luck_mod     :integer
#

#Seed Prefixes DB
puts "Adding prefixes for items to the database..."

  lambda { 
    prefix = ItemPrefix.new
    prefix.base_item_id = 10002
    prefix.name = "Developer's"
    prefix.defense_mod = -10
    prefix.stealth_mod = 10
    prefix.luck_mod = 50
    prefix.save!
  }.call

# == Schema Information
#
# Table name: item_suffixes
#
#  id           :integer          not null, primary key
#  base_item_id :integer
#  name         :string(255)
#  attack_mod   :integer
#  defense_mod  :integer
#  stealth_mod  :integer
#  luck_mod     :integer
#

#Seed Prefixes DB
puts "Adding suffixes for items to the database..."

  lambda { 
    prefix = ItemSuffix.new
    prefix.base_item_id = 10002
    prefix.name = "of Development"
    prefix.defense_mod = 17
    prefix.stealth_mod = -6
    prefix.luck_mod = -12
    prefix.save!
  }.call


#Seed Level DB
puts "Adding level requirements to the database..."

  lambda {
    level = Level.new
    level.level = 1
    level.experience_required = 0
    level.save!

    level = Level.new
    level.level = 2
    level.experience_required = 30
    level.save!

    level = Level.new
    level.level = 3
    level.experience_required = 38
    level.save!

    level = Level.new
    level.level = 4
    level.experience_required = 49
    level.save!

    level = Level.new
    level.level = 5
    level.experience_required = 63
    level.save!

    level = Level.new
    level.level = 6
    level.experience_required = 79
    level.save!

    level = Level.new
    level.level = 7
    level.experience_required = 98
    level.save!

    level = Level.new
    level.level = 8
    level.experience_required = 120
    level.save!

    level = Level.new
    level.level = 9
    level.experience_required = 146
    level.save!

    level = Level.new
    level.level = 10
    level.experience_required = 176
    level.save!

    level = Level.new
    level.level = 11
    level.experience_required = 210
    level.save!

    level = Level.new
    level.level = 12
    level.experience_required = 248
    level.save!

    level = Level.new
    level.level = 13
    level.experience_required = 290
    level.save!

    level = Level.new
    level.level = 14
    level.experience_required = 338
    level.save!

    level = Level.new
    level.level = 15
    level.experience_required = 390
    level.save!

    level = Level.new
    level.level = 16
    level.experience_required = 449
    level.save!

    level = Level.new
    level.level = 17
    level.experience_required = 513
    level.save!

    level = Level.new
    level.level = 18
    level.experience_required = 584
    level.save!

    level = Level.new
    level.level = 19
    level.experience_required = 662
    level.save!

    level = Level.new
    level.level = 20
    level.experience_required = 746
    level.save!

    level = Level.new
    level.level = 21
    level.experience_required = 839
    level.save!

    level = Level.new
    level.level = 22
    level.experience_required = 940
    level.save!

    level = Level.new
    level.level = 23
    level.experience_required = 1050
    level.save!

    level = Level.new
    level.level = 24
    level.experience_required = 1169
    level.save!

    level = Level.new
    level.level = 25
    level.experience_required = 1298
    level.save!

    level = Level.new
    level.level = 26
    level.experience_required = 1437
    level.save!

    level = Level.new
    level.level = 27
    level.experience_required = 1588
    level.save!

    level = Level.new
    level.level = 28
    level.experience_required = 1751
    level.save!

    level = Level.new
    level.level = 29
    level.experience_required = 1927
    level.save!

    level = Level.new
    level.level = 30
    level.experience_required = 2117
    level.save!

    level = Level.new
    level.level = 31
    level.experience_required = 2321
    level.save!

    level = Level.new
    level.level = 32
    level.experience_required = 2540
    level.save!

    level = Level.new
    level.level = 33
    level.experience_required = 2776
    level.save!

    level = Level.new
    level.level = 34
    level.experience_required = 3030
    level.save!

    level = Level.new
    level.level = 35
    level.experience_required = 3302
    level.save!

    level = Level.new
    level.level = 36
    level.experience_required = 3594
    level.save!

    level = Level.new
    level.level = 37
    level.experience_required = 3907
    level.save!

    level = Level.new
    level.level = 38
    level.experience_required = 4242
    level.save!

    level = Level.new
    level.level = 39
    level.experience_required = 4601
    level.save!

    level = Level.new
    level.level = 40
    level.experience_required = 4986
    level.save!

    level = Level.new
    level.level = 41
    level.experience_required = 5397
    level.save!

    level = Level.new
    level.level = 42
    level.experience_required = 5837
    level.save!

    level = Level.new
    level.level = 43
    level.experience_required = 6307
    level.save!

    level = Level.new
    level.level = 44
    level.experience_required = 6810
    level.save!

    level = Level.new
    level.level = 45
    level.experience_required = 7347
    level.save!

    level = Level.new
    level.level = 46
    level.experience_required = 7920
    level.save!

    level = Level.new
    level.level = 47
    level.experience_required = 8532
    level.save!

    level = Level.new
    level.level = 48
    level.experience_required = 9186
    level.save!

    level = Level.new
    level.level = 49
    level.experience_required = 9883
    level.save!

    level = Level.new
    level.level = 50
    level.experience_required = 10626
    level.save!

    level = Level.new
    level.level = 51
    level.experience_required = 11419
    level.save!

    level = Level.new
    level.level = 52
    level.experience_required = 12264
    level.save!

    level = Level.new
    level.level = 53
    level.experience_required = 13165
    level.save!

    level = Level.new
    level.level = 54
    level.experience_required = 14125
    level.save!

    level = Level.new
    level.level = 55
    level.experience_required = 15148
    level.save!

    level = Level.new
    level.level = 56
    level.experience_required = 16237
    level.save!

    level = Level.new
    level.level = 57
    level.experience_required = 17397
    level.save!

    level = Level.new
    level.level = 58
    level.experience_required = 18633
    level.save!

    level = Level.new
    level.level = 59
    level.experience_required = 19948
    level.save!

    level = Level.new
    level.level = 60
    level.experience_required = 21348
    level.save!

    level = Level.new
    level.level = 61
    level.experience_required = 22837
    level.save!

    level = Level.new
    level.level = 62
    level.experience_required = 24423
    level.save!

    level = Level.new
    level.level = 63
    level.experience_required = 26109
    level.save!

    level = Level.new
    level.level = 64
    level.experience_required = 27903
    level.save!

    level = Level.new
    level.level = 65
    level.experience_required = 29811
    level.save!

    level = Level.new
    level.level = 66
    level.experience_required = 31841
    level.save!

    level = Level.new
    level.level = 67
    level.experience_required = 33999
    level.save!

    level = Level.new
    level.level = 68
    level.experience_required = 36293
    level.save!

    level = Level.new
    level.level = 69
    level.experience_required = 38732
    level.save!

    level = Level.new
    level.level = 70
    level.experience_required = 41325
    level.save!

    level = Level.new
    level.level = 71
    level.experience_required = 44081
    level.save!

    level = Level.new
    level.level = 72
    level.experience_required = 47011
    level.save!

    level = Level.new
    level.level = 73
    level.experience_required = 50124
    level.save!

    level = Level.new
    level.level = 74
    level.experience_required = 53431
    level.save!

    level = Level.new
    level.level = 75
    level.experience_required = 56946
    level.save!

    level = Level.new
    level.level = 76
    level.experience_required = 60680
    level.save!

    level = Level.new
    level.level = 77
    level.experience_required = 64647
    level.save!

    level = Level.new
    level.level = 78
    level.experience_required = 68860
    level.save!

    level = Level.new
    level.level = 79
    level.experience_required = 73336
    level.save!

    level = Level.new
    level.level = 80
    level.experience_required = 78090
    level.save!

    level = Level.new
    level.level = 81
    level.experience_required = 83139
    level.save!

    level = Level.new
    level.level = 82
    level.experience_required = 88500
    level.save!

    level = Level.new
    level.level = 83
    level.experience_required = 94194
    level.save!

    level = Level.new
    level.level = 84
    level.experience_required = 100239
    level.save!

    level = Level.new
    level.level = 85
    level.experience_required = 106658
    level.save!

    level = Level.new
    level.level = 86
    level.experience_required = 113474
    level.save!

    level = Level.new
    level.level = 87
    level.experience_required = 120709
    level.save!

    level = Level.new
    level.level = 88
    level.experience_required = 128391
    level.save!

    level = Level.new
    level.level = 89
    level.experience_required = 136545
    level.save!

    level = Level.new
    level.level = 90
    level.experience_required = 145200
    level.save!

    level = Level.new
    level.level = 91
    level.experience_required = 154388
    level.save!

    level = Level.new
    level.level = 92
    level.experience_required = 164139
    level.save!

    level = Level.new
    level.level = 93
    level.experience_required = 174490
    level.save!

    level = Level.new
    level.level = 94
    level.experience_required = 185474
    level.save!

    level = Level.new
    level.level = 95
    level.experience_required = 197132
    level.save!

    level = Level.new
    level.level = 96
    level.experience_required = 209504
    level.save!

    level = Level.new
    level.level = 97
    level.experience_required = 222632
    level.save!

    level = Level.new
    level.level = 98
    level.experience_required = 236564
    level.save!

    level = Level.new
    level.level = 99
    level.experience_required = 251347
    level.save!
  }.call

puts "Finished seeding the database!"
