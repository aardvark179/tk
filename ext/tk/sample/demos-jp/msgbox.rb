#
# message boxes widget demo (called by 'widget')
#

# toplevel widget ��¸�ߤ���к������
if defined?($msgbox_demo) && $msgbox_demo
  $msgbox_demo.destroy 
  $msgbox_demo = nil
end

# demo �Ѥ� toplevel widget ������
$msgbox_demo = TkToplevel.new {|w|
  title("Message Box Demonstration")
  iconname("messagebox")
  positionWindow(w)
}

# label ����
TkLabel.new($msgbox_demo, 'font'=>$font, 'wraplength'=>'4i', 'justify'=>'left',
	    'text'=>"ɽ�����륢������ȥ�å������ܥå����μ��������ǲ������������� \"��å������ܥå���\" �ܥ���򲡤��ȡ����ꤷ����å������ܥå�����ɽ������ޤ���").pack('side'=>'top')

# frame ����
TkFrame.new($msgbox_demo) {|frame|
  TkButton.new(frame) {
    text 'λ��'
    command proc{
      tmppath = $msgbox_demo
      $msgbox_demo = nil
      tmppath.destroy
    }
  }.pack('side'=>'left', 'expand'=>'yes')

  TkButton.new(frame) {
    text '�����ɻ���'
    command proc{showCode 'msgbox'}
  }.pack('side'=>'left', 'expand'=>'yes')

  TkButton.new(frame) {
    text '��å������ܥå���'
    command proc{showMessageBox $msgbox_demo}
  }.pack('side'=>'left', 'expand'=>'yes')
}.pack('side'=>'bottom', 'fill'=>'x', 'pady'=>'2m')

# frame ����
$msgbox_leftframe  = TkFrame.new($msgbox_demo)
$msgbox_rightframe = TkFrame.new($msgbox_demo)
$msgbox_leftframe .pack('side'=>'left', 'expand'=>'yes', 'fill'=>'y', 
			'pady'=>'.5c', 'padx'=>'.5c')
$msgbox_rightframe.pack('side'=>'left', 'expand'=>'yes', 'fill'=>'y', 
			'pady'=>'.5c', 'padx'=>'.5c')

TkLabel.new($msgbox_leftframe, 'text'=>'��������').pack('side'=>'top')
TkFrame.new($msgbox_leftframe, 'relief'=>'ridge', 'bd'=>1, 'height'=>2)\
.pack('side'=>'top', 'fill'=>'x', 'expand'=>'no')

$msgboxIcon = TkVariable.new('info')
['error', 'info', 'question', 'warning'].each {|icon|
  TkRadioButton.new($msgbox_leftframe, 'text'=>icon, 'variable'=>$msgboxIcon, 
		    'relief'=>'flat', 'value'=>icon, 'width'=>16, 
		    'anchor'=>'w').pack('side'=>'top', 'pady'=>2, 
					'anchor'=>'w', 'fill'=>'x')
}

TkLabel.new($msgbox_rightframe, 'text'=>'����').pack('side'=>'top')
TkFrame.new($msgbox_rightframe, 'relief'=>'ridge', 'bd'=>1, 'height'=>2)\
.pack('side'=>'top', 'fill'=>'x', 'expand'=>'no')

$msgboxType = TkVariable.new('ok')
['abortretryignore', 'ok', 'okcancel', 
  'retrycancel', 'yesno', 'yesnocancel'].each {|type|
  TkRadioButton.new($msgbox_rightframe, 'text'=>type, 'variable'=>$msgboxType, 
		    'relief'=>'flat', 'value'=>type, 'width'=>16, 
		    'anchor'=>'w').pack('side'=>'top', 'pady'=>2, 
					'anchor'=>'w', 'fill'=>'x')
}

def showMessageBox(w)
  button = Tk.messageBox('icon'=>$msgboxIcon.value, 'type'=>$msgboxType.value, 
			 'title'=>'Message', 'parent'=>w,
			 'message'=>"����� \"#{$msgboxType.value}\" �Ȥ�������Υ�å������ܥå����ǡ�\"#{$msgboxIcon.value}\" �Υ�������ɽ������Ƥ��ޤ���")

  Tk.messageBox('icon'=>'info', 'type'=>'ok', 'parent'=>w, 
		'message'=>"���ʤ��� \"#{button}\" �򲡤��ޤ����͡�")
end
