package fr.radstar.radeditor ;
import wx.BoxSizer;
import wx.Button;
import wx.FlexGridSizer;
import wx.Frame;
import wx.Menu;
import wx.MenuBar;
import wx.Notebook;
import wx.Panel;
import wx.Scintilla;
import wx.Sizer;
import wx.StaticBoxSizer;
import wx.Window;

class Main  {
	
	var mFrame : Frame;
	var mWindow : Window;
	var mMenuBar : MenuBar;
	
	var mFileMenu : Menu;
	var mNewSubMenu : Menu;
	
	var mEditMenu : Menu;
	
	var mLeftPanel : Panel;
	var mRightPanel : Panel;
	
	var mEditorsTabView : Notebook;
	
	// File
	static inline var OPEN = 0;
	static inline var QUIT = 1;
	
	// New
	static inline var TEXT_FILE = 10;
	static inline var ASSET = 11;
	static inline var PREFAB = 12;
	static inline var LEVEL = 13;
	
	// Edit
	static inline var UNDO = 20;
	static inline var REDO = 21;
	
	public function new () {
		
		mFrame = ApplicationMain.frame;
		
		mMenuBar = new MenuBar();
		mFrame.menuBar = mMenuBar;
		
		mNewSubMenu = new Menu();
		mNewSubMenu.append(TEXT_FILE, "Text File");
		mNewSubMenu.append(ASSET, "Asset");
		mNewSubMenu.append(PREFAB, "Prefab");
		mNewSubMenu.append(LEVEL, "Level");
		
		mFileMenu = new Menu();
		mFileMenu.appendSubMenu(mNewSubMenu, "New");
		mFileMenu.append(OPEN, "Open");
		mFileMenu.appendSeparator();
		mFileMenu.append(QUIT, "Quit");
		mMenuBar.append(mFileMenu, "File");
		
		mEditMenu = new Menu();
		mEditMenu.append(UNDO, "Undo");
		mEditMenu.append(REDO, "Redo");
		mMenuBar.append(mEditMenu, "Edit");
		
		mWindow = Panel.create(mFrame);
		
		var hbox : Sizer = BoxSizer.create(false);
		
		mLeftPanel = Panel.create(mWindow);
		mRightPanel = Panel.create(mWindow);
		
		hbox.add(mLeftPanel, 15,Sizer.EXPAND);
		hbox.add(mRightPanel, 85,Sizer.EXPAND);
		
		mWindow.sizer = hbox;
		
		var rvbox : Sizer = StaticBoxSizer.create(true, mRightPanel, "Editors");
		mRightPanel.sizer = rvbox;
		
		mEditorsTabView = Notebook.create(mRightPanel);
		rvbox.add(mEditorsTabView, 1, Sizer.EXPAND);
		
		var testPage = Window.create(mEditorsTabView);
		var a = Scintilla.create(testPage);
		mEditorsTabView.addPage(testPage, "test");
		
		var v = BoxSizer.create(true);
		v.add(a, 1, Sizer.EXPAND);
		testPage.sizer = v;
	}
} 