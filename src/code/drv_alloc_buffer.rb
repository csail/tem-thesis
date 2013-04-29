module Tem::Buffers
  def alloc_buffer(length)
    apdu = [0x00, 0x20, to_tem_short(length), 0x00].flatten
    response = issue_apdu apdu
    tem_error(response) if failure_code(response)
    return read_tem_byte(response, 0)
  end
end