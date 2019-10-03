# typed: strong

module SessionsHelper
  extend T::Sig
  extend T::Generic

  sig { returns(T::Hash) }
  def cookies(); end

  sig { returns(T::Hash) }
  def session(); end
end