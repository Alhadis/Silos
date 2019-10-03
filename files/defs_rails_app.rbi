# typed: ignore
class Wand < ApplicationRecord
  sig { void }
  def wood_type(); end
end
class Wizard < ApplicationRecord
end
class SpellBook < ApplicationRecord
end
class ApplicationJob < ActiveJob::Base
end
class ApplicationRecord < ActiveRecord::Base
end
class ApplicationMailer < ActionMailer::Base
end
class TestController < ApplicationController
  sig { void }
  def index(); end
end
module ApplicationCable
  class Channel < ActionCable::Channel::Base
  end
  class Connection < ActionCable::Connection::Base
  end
end
class ApplicationController < ActionController::API
end