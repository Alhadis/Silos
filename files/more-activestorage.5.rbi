# typed: strong

# 9/12/2019: Fixed TODO(200)

module ActiveStorage::Blob::Analyzable
  extend T::Sig

  def analyze ; end
  def analyze_later ; end
  def analyzed? ; end
end

module ActiveStorage::Blob::Identifiable
  extend T::Sig

  def identify ; end
  def identified? ; end
end

class ActiveStorage::Variant
  extend T::Sig

  def initialize(blob, variation_or_variation_key) ; end
  def processed ; end
  def key ; end
  def image ; end

  def service_url(expires_in: ActiveStorage.service_urls_expire_in, disposition: :inline)
  end
end
