class Machine
  def start
    flip_switch(:on)
  end
  
  def stop
    flip_switch(:off)
  end

  def state_of_switch
    switch
  end
  
  private

  attr_accessor :switch
  
  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

switch = Machine.new
switch.start
switch.stop
p switch.state_of_switch
