package fr.radstar.radeditor;
import wx.BoxSizer;
import wx.Button;
import wx.Notebook;
import wx.Panel;
import wx.Sizer;
import wx.Window;

/**
 * ...
 * @author Thomas BAUDON
 */
class Editors 
{
	
	public var mainPanel : Panel;
	
	var mNoteBook : Notebook;

	public function new(parent : Window) 
	{
		var vbox : Sizer = BoxSizer.create(true);
		
		mainPanel = Panel.create(parent);
		mainPanel.sizer = vbox;
		
		mNoteBook = Notebook.create(mainPanel);
		vbox.add(mNoteBook, 1, Sizer.EXPAND);
	}
	
}