# typed: strong

module T::Hash
  extend T::Sig
  extend T::Generic

  sig { params(value: Symbol).void }
  def delete(value); end

  sig { params(value: Symbol, value2: Integer).void }
  def []=(value, value2); end

  sig { params(value: Symbol).returns(T.nilable(Integer)) }
  def [](value); end

  sig { returns(T::Hash) }
  def permanent(); end

  sig { returns(T::Hash) }
  def signed(); end
end