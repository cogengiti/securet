using System;
using System.Windows;
using TETCSharpClient;
using TETControls.TrackBox;

namespace SecurET
{
    /// <summary>
    /// Logic of interaction for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window, IConnectionStateListener
    {
        public MainWindow()
        {
            // Load "MainWindow.xaml.cs" and convert it to object.
            InitializeComponent();
            
            // Handle the event raised after the window's content has been rendered.
            this.ContentRendered += MainWindow_ContentRendered;
            
            // Handle the event raised after a key has been presses down.
            this.KeyDown += MainWindow_KeyDown;

            // Handle the event raised after the window has been closed.
            this.Closed += MainWindow_Closed;
        }

        private void MainWindow_ContentRendered(object sender, EventArgs e)
        {
            // Activate/connect client.
            GazeManager.Instance.Activate(GazeManager.ApiVersion.VERSION_1_0, GazeManager.ClientMode.Push);

            // Listen for changes in connection to server.
            GazeManager.Instance.AddConnectionStateListener(this);

            // Fetch current status.
            OnConnectionStateChanged(GazeManager.Instance.IsActivated);

            // Add a fresh instance of the trackbox in case we reinitialize the client connection.
            TrackStatusGrid.Children.Clear();
            TrackStatusGrid.Children.Add(new TrackBoxStatus());
        }

        public void OnConnectionStateChanged(bool isConnected)
        {
            Console.WriteLine("OnConnectionStateChanged");
            //throw new NotImplementedException();
        }
        
        private void MainWindow_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
        {
            Console.WriteLine("MainWindow_KeyDown");
            //throw new NotImplementedException();
        }
        
        private void MainWindow_Closed(object sender, EventArgs e)
        {
            GazeManager.Instance.Deactivate();
        }
    }
}
