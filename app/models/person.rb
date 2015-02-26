class Person < ActiveRecord::Base

  validates (:title && :last_name) || (:first_name && :last_name), presence: true

end
