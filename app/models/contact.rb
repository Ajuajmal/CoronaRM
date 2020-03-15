class Contact < ApplicationRecord
  enum sex: [:male, :female]
  enum district: [:alappuzha, :ernakulam, :idukki, :kannur, :kasargod, :kollam, :kottayam, :kozhikode, :malappuram, :palakkad, :pathanamthitta, :thiruvananthapuram, :thrissur, :wayanad]
  enum risk: [:high, :medium ,:low]
  enum tracking_type: [:primary, :secondary, :patient]

  has_many :infectees, class_name: 'Contact', foreign_key: 'infectee_id'
  belongs_to :infector, class_name: 'Contact', optional: true
end
