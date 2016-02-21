(function () {
  var Eventer = BUS2.Eventer;

  BUS2.LoginForm = React.createClass({
    getInitialState: function () {
      return {
        parent: $('.login-form-container')
      }
    },

    submit: function (ev) {
      var form;
      ev.preventDefault();

      form = $('.login-form');
      var email = ReactDOM.findDOMNode(form.find('.email')[0]);
      var password = ReactDOM.findDOMNode(form.find('.password')[0]);

      var data = {
        user: {
          email: email.value,
          password: password.value,
        }
      };

      $.ajax({
        url: '/users',
        type: 'POST',
        data: data
      }).done(function (data) {
        console.log(data)
      })
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
            <span className="label">Email:</span>
            <input className="email"></input>
            <span className="label">Password:</span>
            <input className="password"></input>
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
