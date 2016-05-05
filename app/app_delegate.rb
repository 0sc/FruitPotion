class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = MainController.alloc.init
    rootViewController.title = 'FruitPotion'
    rootViewController.view.backgroundColor = UIColor.whiteColor
    create_textfield
    create_button
    rootViewController.view.addSubview(@text_field)
    rootViewController.view.addSubview(@button)

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    create_window(navigationController)

    true
  end

  def create_window(rootController)
    screen_frame = UIScreen.mainScreen.bounds
    @window = UIWindow.alloc.initWithFrame(screen_frame)
    @window.rootViewController = rootController
    @window.makeKeyAndVisible
  end

  def create_textfield
    coords = [[15, 80], [265, 40]]
    @text_field = UITextField.alloc.initWithFrame(coords)
    style_text_field(@text_field)
  end

  def style_text_field(text_field)
    text_field.borderStyle = UITextBorderStyleRoundedRect
    text_field.font = UIFont.systemFontOfSize(15)
    text_field.placeholder = 'Enter Text Here'
    text_field.autocorrectionType = UITextAutocorrectionTypeNo
    text_field.keyboardType = UIKeyboardTypeDefault
    text_field.returnKeyType = UIReturnKeyDone
    text_field.clearButtonMode = UITextFieldViewModeWhileEditing
    text_field.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
    text_field.delegate = self
  end

  def create_button
    @button = UIButton.buttonWithType(UIButtonTypeSystem)
    button_frame = CGRectMake(285, 80, 80, 40)
    @button.frame = button_frame
    @button.setTitle('Send', forState: UIControlStateNormal)
    add_border(@button)
    @button.addTarget(self, action: :send_message, forControlEvents: UIControlEventTouchUpInside)
  end

  def add_border(view)
    view.layer.cornerRadius = 4
   view.layer.masksToBounds = true
   view.layer.borderColor = UIColor.colorWithRed(0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0).CGColor # system blue
   view.layer.borderWidth = 1
  end

  def send_message
    puts @text_field.text
  end
end
