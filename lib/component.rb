class Component
  def accept(_visitor)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
