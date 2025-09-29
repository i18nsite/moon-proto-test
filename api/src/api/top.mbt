pub(all) enum ErrUpdateKind {
  LenMismatch
  HashMiss
} derive(Eq, Show)
pub fn ErrUpdateKind::to_enum(self : ErrUpdateKind) -> @protobuf.Enum {
  match self {
    ErrUpdateKind::LenMismatch => 0
    ErrUpdateKind::HashMiss => 1
  }
}
pub fn ErrUpdateKind::from_enum(i : @protobuf.Enum) -> ErrUpdateKind {
  match i.inner() {
    0 => ErrUpdateKind::LenMismatch
    1 => ErrUpdateKind::HashMiss
    _ => Default::default()
  }
}
pub impl Default for ErrUpdateKind with default() -> ErrUpdateKind {
  ErrUpdateKind::LenMismatch
}
pub impl @protobuf.Sized for ErrUpdateKind with size_of(self : ErrUpdateKind) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for ErrUpdateKind with from_json(json: Json, path: @json.JsonPath) -> ErrUpdateKind raise {
  match json {
    String("LenMismatch") => ErrUpdateKind::LenMismatch
    String("HashMiss") => ErrUpdateKind::HashMiss
    Number(0, ..) => ErrUpdateKind::LenMismatch
    Number(1, ..) => ErrUpdateKind::HashMiss
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for ErrUpdateKind with to_json(self : ErrUpdateKind) -> Json {
  match self {
    ErrUpdateKind::LenMismatch => "LenMismatch"
    ErrUpdateKind::HashMiss => "HashMiss"
  }
}
pub(all) struct Void {
} derive(Eq, Show)
pub impl @protobuf.Sized for Void with size_of(_) {
  0
}
pub impl Default for Void with default() -> Void {
  Void::{
  }
}
pub fn Void::new() -> Void {
  Void::{
  }
}
pub impl @protobuf.Read for Void with read_with_limit(_) -> Void noraise {
  Void::default()
}
pub impl @protobuf.Write for Void with write(_, _) -> Unit noraise {
}
pub impl ToJson for Void with to_json(_) {
  {}
}
pub impl @json.FromJson for Void with from_json(_, _) -> Void noraise {
  Void::default()
}
pub impl @protobuf.AsyncRead for Void with read_with_limit(_) -> Void noraise {
  Void::default()
}
pub impl @protobuf.AsyncWrite for Void with write(_, _) -> Unit noraise {
}
pub(all) struct Version {
  mut major : UInt
  mut minor : UInt
  mut patch : UInt
} derive(Eq, Show)
pub impl @protobuf.Sized for Version with size_of(self) {
  let mut size = 0U
  size += 1U + @protobuf.size_of(self.major)
  size += 1U + @protobuf.size_of(self.minor)
  size += 1U + @protobuf.size_of(self.patch)
  size
}
pub impl Default for Version with default() -> Version {
  Version::{
    major : UInt::default(),
    minor : UInt::default(),
    patch : UInt::default(),
  }
}
pub fn Version::new(major : UInt, minor : UInt, patch : UInt) -> Version {
  Version::{
    major,
    minor,
    patch,
  }
}
pub impl @protobuf.Read for Version with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> Version raise {
  let msg = Version::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.major = reader |> @protobuf.read_uint32()
      (2, _) => msg.minor = reader |> @protobuf.read_uint32()
      (3, _) => msg.patch = reader |> @protobuf.read_uint32()
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for Version with write(self: Version, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(8UL);
  writer |> @protobuf.write_uint32(self.major)
  writer |> @protobuf.write_varint(16UL);
  writer |> @protobuf.write_uint32(self.minor)
  writer |> @protobuf.write_varint(24UL);
  writer |> @protobuf.write_uint32(self.patch)
}
pub impl ToJson for Version with to_json(self) {
  let json: Map[String, Json] = {}
  if self.major != Default::default() {
  json["major"] = self.major.to_json()
  }
  if self.minor != Default::default() {
  json["minor"] = self.minor.to_json()
  }
  if self.patch != Default::default() {
  json["patch"] = self.patch.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for Version with from_json(json: Json, path: @json.JsonPath) -> Version raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for Version"))
  }
  let message = Version::default()
  for key, value in obj {
    match (key, value) {
      ("major", value) => message.major = @json.from_json(value, path~)
      ("minor", value) => message.minor = @json.from_json(value, path~)
      ("patch", value) => message.patch = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncRead for Version with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> Version raise {
  let msg = Version::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.major = reader |> @protobuf.async_read_uint32()
      (2, _) => msg.minor = reader |> @protobuf.async_read_uint32()
      (3, _) => msg.patch = reader |> @protobuf.async_read_uint32()
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.AsyncWrite for Version with write(self: Version, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(8UL);
  writer |> @protobuf.async_write_uint32(self.major)
  writer |> @protobuf.async_write_varint(16UL);
  writer |> @protobuf.async_write_uint32(self.minor)
  writer |> @protobuf.async_write_varint(24UL);
  writer |> @protobuf.async_write_uint32(self.patch)
}
pub(all) struct UpdateFile {
  mut txt : String
  mut src_hash : Bytes
  mut path : String
} derive(Eq, Show)
pub impl @protobuf.Sized for UpdateFile with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = @protobuf.size_of(self.txt); @protobuf.size_of(size) + size }
  size += 1U + { let size = @protobuf.size_of(self.src_hash); @protobuf.size_of(size) + size }
  size += 1U + { let size = @protobuf.size_of(self.path); @protobuf.size_of(size) + size }
  size
}
pub impl Default for UpdateFile with default() -> UpdateFile {
  UpdateFile::{
    txt : String::default(),
    src_hash : Bytes::default(),
    path : String::default(),
  }
}
pub fn UpdateFile::new(txt : String, src_hash : Bytes, path : String) -> UpdateFile {
  UpdateFile::{
    txt,
    src_hash,
    path,
  }
}
pub impl @protobuf.Read for UpdateFile with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> UpdateFile raise {
  let msg = UpdateFile::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.txt = reader |> @protobuf.read_string()
      (2, _) => msg.src_hash = reader |> @protobuf.read_bytes()
      (3, _) => msg.path = reader |> @protobuf.read_string()
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for UpdateFile with write(self: UpdateFile, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_string(self.txt)
  writer |> @protobuf.write_varint(18UL);
  writer |> @protobuf.write_bytes(self.src_hash)
  writer |> @protobuf.write_varint(26UL);
  writer |> @protobuf.write_string(self.path)
}
pub impl ToJson for UpdateFile with to_json(self) {
  let json: Map[String, Json] = {}
  if self.txt != Default::default() {
  json["txt"] = self.txt.to_json()
  }
  if self.src_hash != Default::default() {
  json["srcHash"] = @protobuf.base64_encode(self.src_hash).to_json()
  }
  if self.path != Default::default() {
  json["path"] = self.path.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for UpdateFile with from_json(json: Json, path: @json.JsonPath) -> UpdateFile raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for UpdateFile"))
  }
  let message = UpdateFile::default()
  for key, value in obj {
    match (key, value) {
      ("txt", value) => message.txt = @json.from_json(value, path~)
      ("srcHash", String(value)) => message.src_hash = @protobuf.base64_decode(value)
      ("path", value) => message.path = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncRead for UpdateFile with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> UpdateFile raise {
  let msg = UpdateFile::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.txt = reader |> @protobuf.async_read_string()
      (2, _) => msg.src_hash = reader |> @protobuf.async_read_bytes()
      (3, _) => msg.path = reader |> @protobuf.async_read_string()
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.AsyncWrite for UpdateFile with write(self: UpdateFile, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_string(self.txt)
  writer |> @protobuf.async_write_varint(18UL);
  writer |> @protobuf.async_write_bytes(self.src_hash)
  writer |> @protobuf.async_write_varint(26UL);
  writer |> @protobuf.async_write_string(self.path)
}
pub(all) struct Update {
  mut from_lang : UInt
  mut to_lang : UInt
  mut li : Array[UpdateFile]
} derive(Eq, Show)
pub impl @protobuf.Sized for Update with size_of(self) {
  let mut size = 0U
  size += 1U + @protobuf.size_of(self.from_lang)
  size += 1U + @protobuf.size_of(self.to_lang)
  size += self.li.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for Update with default() -> Update {
  Update::{
    from_lang : UInt::default(),
    to_lang : UInt::default(),
    li : [],
  }
}
pub fn Update::new(from_lang : UInt, to_lang : UInt, li : Array[UpdateFile]) -> Update {
  Update::{
    from_lang,
    to_lang,
    li,
  }
}
pub impl @protobuf.Read for Update with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> Update raise {
  let msg = Update::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.from_lang = reader |> @protobuf.read_uint32()
      (2, _) => msg.to_lang = reader |> @protobuf.read_uint32()
      (3, _) => msg.li.push((reader |> @protobuf.read_message() : UpdateFile))
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for Update with write(self: Update, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(8UL);
  writer |> @protobuf.write_uint32(self.from_lang)
  writer |> @protobuf.write_varint(16UL);
  writer |> @protobuf.write_uint32(self.to_lang)
  for item in self.li {
    writer |> @protobuf.write_varint(26UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); @protobuf.Write::write(item, writer)

  }
}
pub impl ToJson for Update with to_json(self) {
  let json: Map[String, Json] = {}
  if self.from_lang != Default::default() {
  json["fromLang"] = self.from_lang.to_json()
  }
  if self.to_lang != Default::default() {
  json["toLang"] = self.to_lang.to_json()
  }
  if self.li != Default::default() {
  json["li"] = self.li.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for Update with from_json(json: Json, path: @json.JsonPath) -> Update raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for Update"))
  }
  let message = Update::default()
  for key, value in obj {
    match (key, value) {
      ("fromLang", value) => message.from_lang = @json.from_json(value, path~)
      ("toLang", value) => message.to_lang = @json.from_json(value, path~)
      ("li", Array(value)) => message.li = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncRead for Update with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> Update raise {
  let msg = Update::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.from_lang = reader |> @protobuf.async_read_uint32()
      (2, _) => msg.to_lang = reader |> @protobuf.async_read_uint32()
      (3, _) => msg.li.push((reader |> @protobuf.async_read_message() : UpdateFile))
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.AsyncWrite for Update with write(self: Update, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(8UL);
  writer |> @protobuf.async_write_uint32(self.from_lang)
  writer |> @protobuf.async_write_varint(16UL);
  writer |> @protobuf.async_write_uint32(self.to_lang)
  for item in self.li {
    writer |> @protobuf.async_write_varint(26UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); @protobuf.AsyncWrite::write(item, writer)

  }
}
pub(all) struct Tran {
  mut from_lang : UInt
  mut to_lang_li : Array[UInt]
  mut txt : String
  mut path : String
} derive(Eq, Show)
pub impl @protobuf.Sized for Tran with size_of(self) {
  let mut size = 0U
  size += 1U + @protobuf.size_of(self.from_lang)
  size += 1U + { let size = self.to_lang_li.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add); @protobuf.size_of(size) + size }
  size += 1U + { let size = @protobuf.size_of(self.txt); @protobuf.size_of(size) + size }
  size += 1U + { let size = @protobuf.size_of(self.path); @protobuf.size_of(size) + size }
  size
}
pub impl Default for Tran with default() -> Tran {
  Tran::{
    from_lang : UInt::default(),
    to_lang_li : [],
    txt : String::default(),
    path : String::default(),
  }
}
pub fn Tran::new(from_lang : UInt, to_lang_li : Array[UInt], txt : String, path : String) -> Tran {
  Tran::{
    from_lang,
    to_lang_li,
    txt,
    path,
  }
}
pub impl @protobuf.Read for Tran with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> Tran raise {
  let msg = Tran::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.from_lang = reader |> @protobuf.read_uint32()
      (2, _) => { msg.to_lang_li.push_iter((reader |> @protobuf.read_packed(@protobuf.read_uint32, None)).iter()) }
      (3, _) => msg.txt = reader |> @protobuf.read_string()
      (4, _) => msg.path = reader |> @protobuf.read_string()
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for Tran with write(self: Tran, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(8UL);
  writer |> @protobuf.write_uint32(self.from_lang)
  writer |> @protobuf.write_varint(18UL)
  let size = self.to_lang_li.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add)
  writer |> @protobuf.write_uint32(size)
  for item in self.to_lang_li {
      writer |> @protobuf.write_uint32(item)

  }
  writer |> @protobuf.write_varint(26UL);
  writer |> @protobuf.write_string(self.txt)
  writer |> @protobuf.write_varint(34UL);
  writer |> @protobuf.write_string(self.path)
}
pub impl ToJson for Tran with to_json(self) {
  let json: Map[String, Json] = {}
  if self.from_lang != Default::default() {
  json["fromLang"] = self.from_lang.to_json()
  }
  if self.to_lang_li != Default::default() {
  json["toLangLi"] = self.to_lang_li.to_json()
  }
  if self.txt != Default::default() {
  json["txt"] = self.txt.to_json()
  }
  if self.path != Default::default() {
  json["path"] = self.path.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for Tran with from_json(json: Json, path: @json.JsonPath) -> Tran raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for Tran"))
  }
  let message = Tran::default()
  for key, value in obj {
    match (key, value) {
      ("fromLang", value) => message.from_lang = @json.from_json(value, path~)
      ("toLangLi", Array(value)) => message.to_lang_li = value.map(v => 
@json.from_json(v, path~))
      ("txt", value) => message.txt = @json.from_json(value, path~)
      ("path", value) => message.path = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncRead for Tran with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> Tran raise {
  let msg = Tran::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.from_lang = reader |> @protobuf.async_read_uint32()
      (2, _) => { msg.to_lang_li.push_iter((reader |> @protobuf.async_read_packed(@protobuf.async_read_uint32, None)).iter()) }
      (3, _) => msg.txt = reader |> @protobuf.async_read_string()
      (4, _) => msg.path = reader |> @protobuf.async_read_string()
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.AsyncWrite for Tran with write(self: Tran, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(8UL);
  writer |> @protobuf.async_write_uint32(self.from_lang)
  writer |> @protobuf.async_write_varint(18UL)
  let size = self.to_lang_li.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add)
  writer |> @protobuf.async_write_uint32(size)
  for item in self.to_lang_li {
      writer |> @protobuf.async_write_uint32(item)

  }
  writer |> @protobuf.async_write_varint(26UL);
  writer |> @protobuf.async_write_string(self.txt)
  writer |> @protobuf.async_write_varint(34UL);
  writer |> @protobuf.async_write_string(self.path)
}
pub(all) struct Job {
  mut update_li : Array[Update]
  mut tran_li : Array[Tran]
} derive(Eq, Show)
pub impl @protobuf.Sized for Job with size_of(self) {
  let mut size = 0U
  size += self.update_li.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.tran_li.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for Job with default() -> Job {
  Job::{
    update_li : [],
    tran_li : [],
  }
}
pub fn Job::new(update_li : Array[Update], tran_li : Array[Tran]) -> Job {
  Job::{
    update_li,
    tran_li,
  }
}
pub impl @protobuf.Read for Job with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> Job raise {
  let msg = Job::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.update_li.push((reader |> @protobuf.read_message() : Update))
      (2, _) => msg.tran_li.push((reader |> @protobuf.read_message() : Tran))
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for Job with write(self: Job, writer : &@protobuf.Writer) -> Unit raise {
  for item in self.update_li {
    writer |> @protobuf.write_varint(10UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); @protobuf.Write::write(item, writer)

  }
  for item in self.tran_li {
    writer |> @protobuf.write_varint(18UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); @protobuf.Write::write(item, writer)

  }
}
pub impl ToJson for Job with to_json(self) {
  let json: Map[String, Json] = {}
  if self.update_li != Default::default() {
  json["updateLi"] = self.update_li.to_json()
  }
  if self.tran_li != Default::default() {
  json["tranLi"] = self.tran_li.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for Job with from_json(json: Json, path: @json.JsonPath) -> Job raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for Job"))
  }
  let message = Job::default()
  for key, value in obj {
    match (key, value) {
      ("updateLi", Array(value)) => message.update_li = value.map(v => 
@json.from_json(v, path~))
      ("tranLi", Array(value)) => message.tran_li = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncRead for Job with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> Job raise {
  let msg = Job::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.update_li.push((reader |> @protobuf.async_read_message() : Update))
      (2, _) => msg.tran_li.push((reader |> @protobuf.async_read_message() : Tran))
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.AsyncWrite for Job with write(self: Job, writer : &@protobuf.AsyncWriter) -> Unit raise {
  for item in self.update_li {
    writer |> @protobuf.async_write_varint(10UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); @protobuf.AsyncWrite::write(item, writer)

  }
  for item in self.tran_li {
    writer |> @protobuf.async_write_varint(18UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); @protobuf.AsyncWrite::write(item, writer)

  }
}
pub(all) struct Traned {
  mut from_lang : UInt
  mut to_lang : UInt
  mut txt : String
  mut src_hash : Bytes
  mut path : String
} derive(Eq, Show)
pub impl @protobuf.Sized for Traned with size_of(self) {
  let mut size = 0U
  size += 1U + @protobuf.size_of(self.from_lang)
  size += 1U + @protobuf.size_of(self.to_lang)
  size += 1U + { let size = @protobuf.size_of(self.txt); @protobuf.size_of(size) + size }
  size += 1U + { let size = @protobuf.size_of(self.src_hash); @protobuf.size_of(size) + size }
  size += 1U + { let size = @protobuf.size_of(self.path); @protobuf.size_of(size) + size }
  size
}
pub impl Default for Traned with default() -> Traned {
  Traned::{
    from_lang : UInt::default(),
    to_lang : UInt::default(),
    txt : String::default(),
    src_hash : Bytes::default(),
    path : String::default(),
  }
}
pub fn Traned::new(from_lang : UInt, to_lang : UInt, txt : String, src_hash : Bytes, path : String) -> Traned {
  Traned::{
    from_lang,
    to_lang,
    txt,
    src_hash,
    path,
  }
}
pub impl @protobuf.Read for Traned with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> Traned raise {
  let msg = Traned::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.from_lang = reader |> @protobuf.read_uint32()
      (2, _) => msg.to_lang = reader |> @protobuf.read_uint32()
      (3, _) => msg.txt = reader |> @protobuf.read_string()
      (4, _) => msg.src_hash = reader |> @protobuf.read_bytes()
      (5, _) => msg.path = reader |> @protobuf.read_string()
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for Traned with write(self: Traned, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(8UL);
  writer |> @protobuf.write_uint32(self.from_lang)
  writer |> @protobuf.write_varint(16UL);
  writer |> @protobuf.write_uint32(self.to_lang)
  writer |> @protobuf.write_varint(26UL);
  writer |> @protobuf.write_string(self.txt)
  writer |> @protobuf.write_varint(34UL);
  writer |> @protobuf.write_bytes(self.src_hash)
  writer |> @protobuf.write_varint(42UL);
  writer |> @protobuf.write_string(self.path)
}
pub impl ToJson for Traned with to_json(self) {
  let json: Map[String, Json] = {}
  if self.from_lang != Default::default() {
  json["fromLang"] = self.from_lang.to_json()
  }
  if self.to_lang != Default::default() {
  json["toLang"] = self.to_lang.to_json()
  }
  if self.txt != Default::default() {
  json["txt"] = self.txt.to_json()
  }
  if self.src_hash != Default::default() {
  json["srcHash"] = @protobuf.base64_encode(self.src_hash).to_json()
  }
  if self.path != Default::default() {
  json["path"] = self.path.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for Traned with from_json(json: Json, path: @json.JsonPath) -> Traned raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for Traned"))
  }
  let message = Traned::default()
  for key, value in obj {
    match (key, value) {
      ("fromLang", value) => message.from_lang = @json.from_json(value, path~)
      ("toLang", value) => message.to_lang = @json.from_json(value, path~)
      ("txt", value) => message.txt = @json.from_json(value, path~)
      ("srcHash", String(value)) => message.src_hash = @protobuf.base64_decode(value)
      ("path", value) => message.path = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncRead for Traned with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> Traned raise {
  let msg = Traned::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.from_lang = reader |> @protobuf.async_read_uint32()
      (2, _) => msg.to_lang = reader |> @protobuf.async_read_uint32()
      (3, _) => msg.txt = reader |> @protobuf.async_read_string()
      (4, _) => msg.src_hash = reader |> @protobuf.async_read_bytes()
      (5, _) => msg.path = reader |> @protobuf.async_read_string()
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.AsyncWrite for Traned with write(self: Traned, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(8UL);
  writer |> @protobuf.async_write_uint32(self.from_lang)
  writer |> @protobuf.async_write_varint(16UL);
  writer |> @protobuf.async_write_uint32(self.to_lang)
  writer |> @protobuf.async_write_varint(26UL);
  writer |> @protobuf.async_write_string(self.txt)
  writer |> @protobuf.async_write_varint(34UL);
  writer |> @protobuf.async_write_bytes(self.src_hash)
  writer |> @protobuf.async_write_varint(42UL);
  writer |> @protobuf.async_write_string(self.path)
}
pub(all) struct ErrUnsupportExt {
  mut from_lang : UInt
  mut path : String
} derive(Eq, Show)
pub impl @protobuf.Sized for ErrUnsupportExt with size_of(self) {
  let mut size = 0U
  size += 1U + @protobuf.size_of(self.from_lang)
  size += 1U + { let size = @protobuf.size_of(self.path); @protobuf.size_of(size) + size }
  size
}
pub impl Default for ErrUnsupportExt with default() -> ErrUnsupportExt {
  ErrUnsupportExt::{
    from_lang : UInt::default(),
    path : String::default(),
  }
}
pub fn ErrUnsupportExt::new(from_lang : UInt, path : String) -> ErrUnsupportExt {
  ErrUnsupportExt::{
    from_lang,
    path,
  }
}
pub impl @protobuf.Read for ErrUnsupportExt with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> ErrUnsupportExt raise {
  let msg = ErrUnsupportExt::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.from_lang = reader |> @protobuf.read_uint32()
      (2, _) => msg.path = reader |> @protobuf.read_string()
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for ErrUnsupportExt with write(self: ErrUnsupportExt, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(8UL);
  writer |> @protobuf.write_uint32(self.from_lang)
  writer |> @protobuf.write_varint(18UL);
  writer |> @protobuf.write_string(self.path)
}
pub impl ToJson for ErrUnsupportExt with to_json(self) {
  let json: Map[String, Json] = {}
  if self.from_lang != Default::default() {
  json["fromLang"] = self.from_lang.to_json()
  }
  if self.path != Default::default() {
  json["path"] = self.path.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for ErrUnsupportExt with from_json(json: Json, path: @json.JsonPath) -> ErrUnsupportExt raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for ErrUnsupportExt"))
  }
  let message = ErrUnsupportExt::default()
  for key, value in obj {
    match (key, value) {
      ("fromLang", value) => message.from_lang = @json.from_json(value, path~)
      ("path", value) => message.path = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncRead for ErrUnsupportExt with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> ErrUnsupportExt raise {
  let msg = ErrUnsupportExt::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.from_lang = reader |> @protobuf.async_read_uint32()
      (2, _) => msg.path = reader |> @protobuf.async_read_string()
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.AsyncWrite for ErrUnsupportExt with write(self: ErrUnsupportExt, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(8UL);
  writer |> @protobuf.async_write_uint32(self.from_lang)
  writer |> @protobuf.async_write_varint(18UL);
  writer |> @protobuf.async_write_string(self.path)
}
pub(all) struct ErrParse {
  mut from_lang : UInt
  mut path : String
  mut msg : String
} derive(Eq, Show)
pub impl @protobuf.Sized for ErrParse with size_of(self) {
  let mut size = 0U
  size += 1U + @protobuf.size_of(self.from_lang)
  size += 1U + { let size = @protobuf.size_of(self.path); @protobuf.size_of(size) + size }
  size += 1U + { let size = @protobuf.size_of(self.msg); @protobuf.size_of(size) + size }
  size
}
pub impl Default for ErrParse with default() -> ErrParse {
  ErrParse::{
    from_lang : UInt::default(),
    path : String::default(),
    msg : String::default(),
  }
}
pub fn ErrParse::new(from_lang : UInt, path : String, msg : String) -> ErrParse {
  ErrParse::{
    from_lang,
    path,
    msg,
  }
}
pub impl @protobuf.Read for ErrParse with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> ErrParse raise {
  let msg = ErrParse::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.from_lang = reader |> @protobuf.read_uint32()
      (2, _) => msg.path = reader |> @protobuf.read_string()
      (3, _) => msg.msg = reader |> @protobuf.read_string()
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for ErrParse with write(self: ErrParse, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(8UL);
  writer |> @protobuf.write_uint32(self.from_lang)
  writer |> @protobuf.write_varint(18UL);
  writer |> @protobuf.write_string(self.path)
  writer |> @protobuf.write_varint(26UL);
  writer |> @protobuf.write_string(self.msg)
}
pub impl ToJson for ErrParse with to_json(self) {
  let json: Map[String, Json] = {}
  if self.from_lang != Default::default() {
  json["fromLang"] = self.from_lang.to_json()
  }
  if self.path != Default::default() {
  json["path"] = self.path.to_json()
  }
  if self.msg != Default::default() {
  json["msg"] = self.msg.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for ErrParse with from_json(json: Json, path: @json.JsonPath) -> ErrParse raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for ErrParse"))
  }
  let message = ErrParse::default()
  for key, value in obj {
    match (key, value) {
      ("fromLang", value) => message.from_lang = @json.from_json(value, path~)
      ("path", value) => message.path = @json.from_json(value, path~)
      ("msg", value) => message.msg = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncRead for ErrParse with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> ErrParse raise {
  let msg = ErrParse::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.from_lang = reader |> @protobuf.async_read_uint32()
      (2, _) => msg.path = reader |> @protobuf.async_read_string()
      (3, _) => msg.msg = reader |> @protobuf.async_read_string()
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.AsyncWrite for ErrParse with write(self: ErrParse, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(8UL);
  writer |> @protobuf.async_write_uint32(self.from_lang)
  writer |> @protobuf.async_write_varint(18UL);
  writer |> @protobuf.async_write_string(self.path)
  writer |> @protobuf.async_write_varint(26UL);
  writer |> @protobuf.async_write_string(self.msg)
}
pub(all) struct ErrOverdraw {
  mut debt : UInt64
  mut currency : UInt
} derive(Eq, Show)
pub impl @protobuf.Sized for ErrOverdraw with size_of(self) {
  let mut size = 0U
  size += 1U + @protobuf.size_of(self.debt)
  size += 1U + @protobuf.size_of(self.currency)
  size
}
pub impl Default for ErrOverdraw with default() -> ErrOverdraw {
  ErrOverdraw::{
    debt : UInt64::default(),
    currency : UInt::default(),
  }
}
pub fn ErrOverdraw::new(debt : UInt64, currency : UInt) -> ErrOverdraw {
  ErrOverdraw::{
    debt,
    currency,
  }
}
pub impl @protobuf.Read for ErrOverdraw with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> ErrOverdraw raise {
  let msg = ErrOverdraw::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.debt = reader |> @protobuf.read_uint64()
      (2, _) => msg.currency = reader |> @protobuf.read_uint32()
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for ErrOverdraw with write(self: ErrOverdraw, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(8UL);
  writer |> @protobuf.write_uint64(self.debt)
  writer |> @protobuf.write_varint(16UL);
  writer |> @protobuf.write_uint32(self.currency)
}
pub impl ToJson for ErrOverdraw with to_json(self) {
  let json: Map[String, Json] = {}
  if self.debt != Default::default() {
  json["debt"] = self.debt.to_json()
  }
  if self.currency != Default::default() {
  json["currency"] = self.currency.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for ErrOverdraw with from_json(json: Json, path: @json.JsonPath) -> ErrOverdraw raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for ErrOverdraw"))
  }
  let message = ErrOverdraw::default()
  for key, value in obj {
    match (key, value) {
      ("debt", value) => message.debt = @json.from_json(value, path~)
      ("currency", value) => message.currency = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncRead for ErrOverdraw with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> ErrOverdraw raise {
  let msg = ErrOverdraw::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.debt = reader |> @protobuf.async_read_uint64()
      (2, _) => msg.currency = reader |> @protobuf.async_read_uint32()
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.AsyncWrite for ErrOverdraw with write(self: ErrOverdraw, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(8UL);
  writer |> @protobuf.async_write_uint64(self.debt)
  writer |> @protobuf.async_write_varint(16UL);
  writer |> @protobuf.async_write_uint32(self.currency)
}
pub(all) struct ErrTokenInvalid {
} derive(Eq, Show)
pub impl @protobuf.Sized for ErrTokenInvalid with size_of(_) {
  0
}
pub impl Default for ErrTokenInvalid with default() -> ErrTokenInvalid {
  ErrTokenInvalid::{
  }
}
pub fn ErrTokenInvalid::new() -> ErrTokenInvalid {
  ErrTokenInvalid::{
  }
}
pub impl @protobuf.Read for ErrTokenInvalid with read_with_limit(_) -> ErrTokenInvalid noraise {
  ErrTokenInvalid::default()
}
pub impl @protobuf.Write for ErrTokenInvalid with write(_, _) -> Unit noraise {
}
pub impl ToJson for ErrTokenInvalid with to_json(_) {
  {}
}
pub impl @json.FromJson for ErrTokenInvalid with from_json(_, _) -> ErrTokenInvalid noraise {
  ErrTokenInvalid::default()
}
pub impl @protobuf.AsyncRead for ErrTokenInvalid with read_with_limit(_) -> ErrTokenInvalid noraise {
  ErrTokenInvalid::default()
}
pub impl @protobuf.AsyncWrite for ErrTokenInvalid with write(_, _) -> Unit noraise {
}
pub(all) struct ErrTran {
  mut from_lang : UInt
  mut to_lang : UInt
  mut path : String
  mut msg : String
} derive(Eq, Show)
pub impl @protobuf.Sized for ErrTran with size_of(self) {
  let mut size = 0U
  size += 1U + @protobuf.size_of(self.from_lang)
  size += 1U + @protobuf.size_of(self.to_lang)
  size += 1U + { let size = @protobuf.size_of(self.path); @protobuf.size_of(size) + size }
  size += 1U + { let size = @protobuf.size_of(self.msg); @protobuf.size_of(size) + size }
  size
}
pub impl Default for ErrTran with default() -> ErrTran {
  ErrTran::{
    from_lang : UInt::default(),
    to_lang : UInt::default(),
    path : String::default(),
    msg : String::default(),
  }
}
pub fn ErrTran::new(from_lang : UInt, to_lang : UInt, path : String, msg : String) -> ErrTran {
  ErrTran::{
    from_lang,
    to_lang,
    path,
    msg,
  }
}
pub impl @protobuf.Read for ErrTran with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> ErrTran raise {
  let msg = ErrTran::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.from_lang = reader |> @protobuf.read_uint32()
      (2, _) => msg.to_lang = reader |> @protobuf.read_uint32()
      (3, _) => msg.path = reader |> @protobuf.read_string()
      (4, _) => msg.msg = reader |> @protobuf.read_string()
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for ErrTran with write(self: ErrTran, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(8UL);
  writer |> @protobuf.write_uint32(self.from_lang)
  writer |> @protobuf.write_varint(16UL);
  writer |> @protobuf.write_uint32(self.to_lang)
  writer |> @protobuf.write_varint(26UL);
  writer |> @protobuf.write_string(self.path)
  writer |> @protobuf.write_varint(34UL);
  writer |> @protobuf.write_string(self.msg)
}
pub impl ToJson for ErrTran with to_json(self) {
  let json: Map[String, Json] = {}
  if self.from_lang != Default::default() {
  json["fromLang"] = self.from_lang.to_json()
  }
  if self.to_lang != Default::default() {
  json["toLang"] = self.to_lang.to_json()
  }
  if self.path != Default::default() {
  json["path"] = self.path.to_json()
  }
  if self.msg != Default::default() {
  json["msg"] = self.msg.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for ErrTran with from_json(json: Json, path: @json.JsonPath) -> ErrTran raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for ErrTran"))
  }
  let message = ErrTran::default()
  for key, value in obj {
    match (key, value) {
      ("fromLang", value) => message.from_lang = @json.from_json(value, path~)
      ("toLang", value) => message.to_lang = @json.from_json(value, path~)
      ("path", value) => message.path = @json.from_json(value, path~)
      ("msg", value) => message.msg = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncRead for ErrTran with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> ErrTran raise {
  let msg = ErrTran::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.from_lang = reader |> @protobuf.async_read_uint32()
      (2, _) => msg.to_lang = reader |> @protobuf.async_read_uint32()
      (3, _) => msg.path = reader |> @protobuf.async_read_string()
      (4, _) => msg.msg = reader |> @protobuf.async_read_string()
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.AsyncWrite for ErrTran with write(self: ErrTran, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(8UL);
  writer |> @protobuf.async_write_uint32(self.from_lang)
  writer |> @protobuf.async_write_varint(16UL);
  writer |> @protobuf.async_write_uint32(self.to_lang)
  writer |> @protobuf.async_write_varint(26UL);
  writer |> @protobuf.async_write_string(self.path)
  writer |> @protobuf.async_write_varint(34UL);
  writer |> @protobuf.async_write_string(self.msg)
}
pub(all) struct ErrUpdate {
  mut kind :  ErrUpdateKind 
  mut from_lang : UInt
  mut to_lang : UInt
  mut path : String
} derive(Eq, Show)
pub impl @protobuf.Sized for ErrUpdate with size_of(self) {
  let mut size = 0U
  size += 1U + @protobuf.size_of(self.kind)
  size += 1U + @protobuf.size_of(self.from_lang)
  size += 1U + @protobuf.size_of(self.to_lang)
  size += 1U + { let size = @protobuf.size_of(self.path); @protobuf.size_of(size) + size }
  size
}
pub impl Default for ErrUpdate with default() -> ErrUpdate {
  ErrUpdate::{
    kind : ErrUpdateKind::default(),
    from_lang : UInt::default(),
    to_lang : UInt::default(),
    path : String::default(),
  }
}
pub fn ErrUpdate::new(kind : ErrUpdateKind, from_lang : UInt, to_lang : UInt, path : String) -> ErrUpdate {
  ErrUpdate::{
    kind,
    from_lang,
    to_lang,
    path,
  }
}
pub impl @protobuf.Read for ErrUpdate with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> ErrUpdate raise {
  let msg = ErrUpdate::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.kind = reader |> @protobuf.read_enum() |> ErrUpdateKind::from_enum
      (2, _) => msg.from_lang = reader |> @protobuf.read_uint32()
      (3, _) => msg.to_lang = reader |> @protobuf.read_uint32()
      (4, _) => msg.path = reader |> @protobuf.read_string()
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for ErrUpdate with write(self: ErrUpdate, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(8UL);
  writer |> @protobuf.write_enum(self.kind.to_enum())
  writer |> @protobuf.write_varint(16UL);
  writer |> @protobuf.write_uint32(self.from_lang)
  writer |> @protobuf.write_varint(24UL);
  writer |> @protobuf.write_uint32(self.to_lang)
  writer |> @protobuf.write_varint(34UL);
  writer |> @protobuf.write_string(self.path)
}
pub impl ToJson for ErrUpdate with to_json(self) {
  let json: Map[String, Json] = {}
  if self.kind != Default::default() {
  json["kind"] = self.kind.to_json()
  }
  if self.from_lang != Default::default() {
  json["fromLang"] = self.from_lang.to_json()
  }
  if self.to_lang != Default::default() {
  json["toLang"] = self.to_lang.to_json()
  }
  if self.path != Default::default() {
  json["path"] = self.path.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for ErrUpdate with from_json(json: Json, path: @json.JsonPath) -> ErrUpdate raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for ErrUpdate"))
  }
  let message = ErrUpdate::default()
  for key, value in obj {
    match (key, value) {
      ("kind", value) => message.kind = @json.from_json(value, path~)
      ("fromLang", value) => message.from_lang = @json.from_json(value, path~)
      ("toLang", value) => message.to_lang = @json.from_json(value, path~)
      ("path", value) => message.path = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncRead for ErrUpdate with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> ErrUpdate raise {
  let msg = ErrUpdate::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.kind = reader |> @protobuf.async_read_enum() |> ErrUpdateKind::from_enum
      (2, _) => msg.from_lang = reader |> @protobuf.async_read_uint32()
      (3, _) => msg.to_lang = reader |> @protobuf.async_read_uint32()
      (4, _) => msg.path = reader |> @protobuf.async_read_string()
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.AsyncWrite for ErrUpdate with write(self: ErrUpdate, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(8UL);
  writer |> @protobuf.async_write_enum(self.kind.to_enum())
  writer |> @protobuf.async_write_varint(16UL);
  writer |> @protobuf.async_write_uint32(self.from_lang)
  writer |> @protobuf.async_write_varint(24UL);
  writer |> @protobuf.async_write_uint32(self.to_lang)
  writer |> @protobuf.async_write_varint(34UL);
  writer |> @protobuf.async_write_string(self.path)
}
pub(all) struct ErrUpdateHashMiss {
} derive(Eq, Show)
pub impl @protobuf.Sized for ErrUpdateHashMiss with size_of(_) {
  0
}
pub impl Default for ErrUpdateHashMiss with default() -> ErrUpdateHashMiss {
  ErrUpdateHashMiss::{
  }
}
pub fn ErrUpdateHashMiss::new() -> ErrUpdateHashMiss {
  ErrUpdateHashMiss::{
  }
}
pub impl @protobuf.Read for ErrUpdateHashMiss with read_with_limit(_) -> ErrUpdateHashMiss noraise {
  ErrUpdateHashMiss::default()
}
pub impl @protobuf.Write for ErrUpdateHashMiss with write(_, _) -> Unit noraise {
}
pub impl ToJson for ErrUpdateHashMiss with to_json(_) {
  {}
}
pub impl @json.FromJson for ErrUpdateHashMiss with from_json(_, _) -> ErrUpdateHashMiss noraise {
  ErrUpdateHashMiss::default()
}
pub impl @protobuf.AsyncRead for ErrUpdateHashMiss with read_with_limit(_) -> ErrUpdateHashMiss noraise {
  ErrUpdateHashMiss::default()
}
pub impl @protobuf.AsyncWrite for ErrUpdateHashMiss with write(_, _) -> Unit noraise {
}
pub(all) struct TranResult {
  mut kind : TranResult_Kind
} derive(Eq, Show)
pub(all) enum TranResult_Kind {
  Traned(Traned)
  ErrTran(ErrTran)
  ErrTokenInvalid(ErrTokenInvalid)
  ErrOverdraw(ErrOverdraw)
  ErrUnsupportExt(ErrUnsupportExt)
  ErrParse(ErrParse)
  ErrUpdate(ErrUpdate)
  NotSet
} derive(Eq, Show)
pub impl Default for TranResult_Kind with default() -> TranResult_Kind {
  NotSet
}
pub impl @json.FromJson for TranResult_Kind with from_json(json: Json, path: @json.JsonPath) -> TranResult_Kind raise {
  if (try? TranResult_Kind::Traned(json |> @json.from_json(path~))) is Ok(value) {
    return value
  }
  if (try? TranResult_Kind::ErrTran(json |> @json.from_json(path~))) is Ok(value) {
    return value
  }
  if (try? TranResult_Kind::ErrTokenInvalid(json |> @json.from_json(path~))) is Ok(value) {
    return value
  }
  if (try? TranResult_Kind::ErrOverdraw(json |> @json.from_json(path~))) is Ok(value) {
    return value
  }
  if (try? TranResult_Kind::ErrUnsupportExt(json |> @json.from_json(path~))) is Ok(value) {
    return value
  }
  if (try? TranResult_Kind::ErrParse(json |> @json.from_json(path~))) is Ok(value) {
    return value
  }
  if (try? TranResult_Kind::ErrUpdate(json |> @json.from_json(path~))) is Ok(value) {
    return value
  }
TranResult_Kind::NotSet
}
pub impl ToJson for TranResult_Kind with to_json(self : TranResult_Kind) -> Json {
  match self {
    TranResult_Kind::Traned(v) => v.to_json()
    TranResult_Kind::ErrTran(v) => v.to_json()
    TranResult_Kind::ErrTokenInvalid(v) => v.to_json()
    TranResult_Kind::ErrOverdraw(v) => v.to_json()
    TranResult_Kind::ErrUnsupportExt(v) => v.to_json()
    TranResult_Kind::ErrParse(v) => v.to_json()
    TranResult_Kind::ErrUpdate(v) => v.to_json()
    TranResult_Kind::NotSet => Json::null()
  }
}
pub impl @protobuf.Sized for TranResult with size_of(_) {
  0
}
pub impl Default for TranResult with default() -> TranResult {
  TranResult::{
    kind : TranResult_Kind::NotSet,
  }
}
pub fn TranResult::new(kind~: TranResult_Kind = TranResult_Kind::NotSet) -> TranResult {
  TranResult::{
    kind,
  }
}
pub impl @protobuf.Read for TranResult with read_with_limit(_) -> TranResult noraise {
  TranResult::default()
}
pub impl @protobuf.Write for TranResult with write(_, _) -> Unit noraise {
}
pub impl ToJson for TranResult with to_json(_) {
  {}
}
pub impl @json.FromJson for TranResult with from_json(_, _) -> TranResult noraise {
  TranResult::default()
}
pub impl @protobuf.AsyncRead for TranResult with read_with_limit(_) -> TranResult noraise {
  TranResult::default()
}
pub impl @protobuf.AsyncWrite for TranResult with write(_, _) -> Unit noraise {
}
