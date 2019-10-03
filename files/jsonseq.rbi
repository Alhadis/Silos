interface JSONSEQ::_ReadIO
  def readline: (String) -> String
end

type JSONSEQ::Reader::decoder = ^(String) -> any
type JSONSEQ::Reader::result = JSONObject | EndOfFile | ParsingError | MaybeTruncated

class JSONSEQ::Reader
  attr_reader io: _ReadIO
  attr_reader decoder: decoder

  def initialize: (io: _ReadIO, ?decoder: decoder) -> any
  def read: () -> result
  def each: () { (result) -> any } -> void
          | () -> Enumerable<result, void>
  def read_object: () -> any
  def each_object: () ?{ (any) -> any } -> any
  def decode_string: (String) -> any
  def truncated?: (String) -> bool
end

JSONSEQ::Reader::DEFAULT_DECODER: decoder

class JSONSEQ::Reader::JSONObject
  attr_reader object: any
  def initialize: (object: any) -> any
end

class JSONSEQ::Reader::EndOfFile
end

class JSONSEQ::Reader::ParsingError
  attr_reader source: String
  attr_reader exception: any
  def initialize: (source: String, exception: any) -> any
end

class JSONSEQ::Reader::MaybeTruncated
  attr_reader source: String
  attr_reader object: any
  def initialize: (source: String, object: any) -> any
end

JSONSEQ::Reader::DEFAULT_DECODER: any

type JSONSEQ::Writer::encoder = ^(any) -> String
interface JSONSEQ::Writer::_WriteIO
  def write: (String) -> void
  def flush: () -> void
end

class JSONSEQ::Writer
  attr_reader io: _WriteIO
  attr_reader encoder: encoder
  def initialize: (io: _WriteIO, ?encoder: encoder) -> any
  def <<: (any) -> void
  def write: (any) -> void
end

JSONSEQ::Writer::DEFAULT_ENCODER: encoder

JSONSEQ::VERSION: String
JSONSEQ::RS: String
JSONSEQ::LF: String
