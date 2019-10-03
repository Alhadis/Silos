# typed: strong

class OpenStruct
  extend T::Sig
  extend T::Generic

  sig { returns(Integer) }
  def yes_rsvp_count(); end

  sig { returns(OpenStruct) }
  def venue(); end

  sig { returns(String) }
  def state(); end

  sig { returns(String) }
  def city(); end

  sig { returns(String) }
  def address_1(); end

  sig { returns(String) }
  def name(); end

  sig { returns(Integer) }
  def time(); end

end