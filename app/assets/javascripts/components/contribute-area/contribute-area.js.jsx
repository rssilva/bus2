(function () {
  var Eventer = BUS2.Eventer;

  BUS2.ContributeArea = React.createClass({
    getInitialState: function () {
      this.setEvents();

      return {
        isOpen: false,
        firstForm: '',
        loginForm: '',
        registerForm: '',
      }
    },

    setEvents: function () {
      var that = this;

      Eventer.on('setContribution', function () {
        // that.setContribution();
      });

      Eventer.on('contributeClick', function () {
        that.onContributeClick();
      });

      Eventer.on('contributeStartClick', function () {
        that.onStartClick();
      });

      Eventer.on('contributeRegisterClick', function () {
        that.onRegisterClick();
      });
    },

    onContributeClick: function () {
      this.setContribution();
    },

    onStartClick: function () {
      if (BUS2.isLogged) {

      }

      if (!BUS2.isLogged) {
        this.renderFirstForm(false);
        this.renderRegisterForm(false);
        this.renderLoginForm(true);
      }
    },

    onRegisterClick: function () {
      this.renderFirstForm(false);
      this.renderRegisterForm(true);
      this.renderLoginForm(false);
    },

    setContribution: function () {
      var isOpen = this.state.isOpen;

      if (isOpen) {
        this.setState({isOpen: false})
        this.renderFirstForm(false);
      }

      if (!isOpen) {
        this.setState({isOpen: true});
        this.renderFirstForm(true);
      }
    },

    renderFirstForm: function (shouldRender) {
      if (shouldRender) {
        this.setState({firstForm: <BUS2.ContributeStartForm />});
      }

      if (!shouldRender) {
        this.setState({firstForm: ''});
      }
    },

    renderRegisterForm: function (shouldRender) {
      if (shouldRender) {
        this.setState({registerForm: <BUS2.RegisterForm />});
      }

      if (!shouldRender) {
        this.setState({registerForm: ''});
      }
    },

    renderLoginForm: function (shouldRender) {
      if (shouldRender) {
        this.setState({loginForm: <BUS2.LoginForm />});
      }

      if (!shouldRender) {
        this.setState({loginForm: ''});
      }
    },

    render: function () {
      return (
        <div className="contribute-area">
          <div className="contribute-start-form-container hidden">
            {this.state.firstForm}
          </div>
          <div className="login-form-container hidden">
            {this.state.loginForm}
          </div>
          <div className="register-form-container hidden">
            {this.state.registerForm}
          </div>
        </div>
      )
    }
  });
})();
