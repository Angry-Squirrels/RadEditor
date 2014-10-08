package fr.radstar.radeditor ;
import wx.BoxSizer;
import wx.Button;
import wx.clay.AddPosition;
import wx.clay.Container;
import wx.clay.Manager;
import wx.clay.Toolbox;
import wx.EventID;
import wx.FlexGridSizer;
import wx.Frame;
import wx.MDIParentFrame;
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
	static inline var OPEN_PROJECT = 1;
	static inline var SAVE = 2;
	static inline var SAVE_AS = 3;
	static inline var CLOSE = 4;
	static inline var QUIT = 5;
	
	// New
	static inline var ASSET = 10;
	static inline var PREFAB = 11;
	static inline var LEVEL = 12;
	static inline var PROJECT = 13;
	
	// Edit
	static inline var UNDO = 20;
	static inline var REDO = 21;
	
	public function new () {
		
		mFrame = ApplicationMain.frame;
		
		initMenu();
		
		mWindow = Panel.create(mFrame);
		
		var hbox : Sizer = BoxSizer.create(false);
		mWindow.sizer = hbox;
		
		var mEditors = new Editors(mWindow);
		
		mLeftPanel = Panel.create(mWindow);
		
		hbox.add(mLeftPanel, 15, Sizer.EXPAND);
		hbox.add(mEditors.mainPanel, 85, Sizer.EXPAND);
		
		var manager : Manager = new Manager(mFrame);
		var root : Container = manager.root;
		root.addWindow(mLeftPanel, AddPosition.Left);
		root.addWindow(mEditors.mainPanel, AddPosition.Left);
		
	}
	
	function initMenu():Void 
	{
		mMenuBar = new MenuBar();
		mFrame.menuBar = mMenuBar;
		
		mNewSubMenu = new Menu();
		mNewSubMenu.append(ASSET, "Asset");
		mNewSubMenu.append(PREFAB, "Prefab");
		mNewSubMenu.append(LEVEL, "Level");
		mNewSubMenu.append(PROJECT, "Project");
		
		mFileMenu = new Menu();
		mFileMenu.appendSubMenu(mNewSubMenu, "New");
		mFileMenu.append(OPEN, "Open");
		mFileMenu.append(OPEN_PROJECT, "Open Project");
		mFileMenu.appendSeparator();
		mFileMenu.append(SAVE, "Save");
		mFileMenu.append(SAVE_AS, "Save as");
		mFileMenu.appendSeparator();
		mFileMenu.append(CLOSE, "Close");
		mFileMenu.appendSeparator();
		mFileMenu.append(QUIT, "Quit");
		mMenuBar.append(mFileMenu, "File");
		
		mEditMenu = new Menu();
		mEditMenu.append(UNDO, "Undo");
		mEditMenu.append(REDO, "Redo");
		mMenuBar.append(mEditMenu, "Edit");
	}
} 