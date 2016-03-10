require "administrate/base_dashboard"

class LocationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    street_number: Field::String,
    street_name: Field::String,
    city: Field::String,
    state: Field::String,
    zip: Field::String,
    date: Field::String,
    time: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    info: Field::Text,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :street_number,
    :street_name,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :street_number,
    :street_name,
    :city,
    :state,
    :zip,
    :date,
    :time,
    :created_at,
    :updated_at,
    :info,
    :latitude,
    :longitude,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :street_number,
    :street_name,
    :city,
    :state,
    :zip,
    :date,
    :time,
    :info,
    :latitude,
    :longitude,
  ]

  # Overwrite this method to customize how locations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(location)
  #   "Location ##{location.id}"
  # end
end
