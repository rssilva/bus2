(function () {
  var Eventer = BUS2.Eventer;

  BUS2.LoginForm = React.createClass({
    getInitialState: function () {
      return {
        parent: $('.login-form-container')
      }
    },

    submit: function (ev) {
      var that = this;

      var form = $('.login-form');

      var email = ReactDOM.findDOMNode(form.find('.email')[0]);
      var password = ReactDOM.findDOMNode(form.find('.password')[0]);

      var data = {
        auth: {
          email: email.value,
          password: password.value,
        }
      };

      $.ajax({
        url: '/knock/auth_token',
        type: 'POST',
        data: data
      }).done(function (data) {
        that.onLoginSuccess(data);
      });

      ev.preventDefault();
    },

    onLoginSuccess: function (data) {
      window.localStorage.setItem('TOKEN', data.jwt)
      Eventer.trigger('loginSuccessful', {jwt: data.jwt});
    },

    onRegisterClick: function () {
      Eventer.trigger('contributeRegisterClick');
    },

    componentDidMount: function () {
      this.state.parent.removeClass('hidden');
    },

    componentWillUnmount: function () {
      this.state.parent.addClass('hidden');
    },

    render: function () {
      return (
        <div>
          <form className="login-form" onSubmit={this.submit}>
            <span className="label" name="email">Email:</span>
            <input className="email"></input>
            <span className="label">Password:</span>
            <input className="password" type="password"></input>
            <input type="submit" value="Login"/>
          </form>
          <button className="register-contribute-button" onClick={this.onRegisterClick}>
            Register
          </button>
        </div>
      );
    }
  });
})();
