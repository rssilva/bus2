(function () {
  var Eventer = BUS2.Eventer;

  BUS2.RegisterForm = React.createClass({
    getInitialState: function () {
      return {
        parent: $('.register-form-container')
      }
    },

    submit: function (ev) {
      var form;
      ev.preventDefault();

      form = $('.register-form');
      var name = ReactDOM.findDOMNode(form.find('.name')[0]);
      var email = ReactDOM.findDOMNode(form.find('.email')[0]);
      var password = ReactDOM.findDOMNode(form.find('.password')[0]);
      var passConfirm = ReactDOM.findDOMNode(form.find('.password-confirmation')[0]);

      var data = {
        user: {
          name: name.value,
          email: email.value,
          password: password.value,
          password_confirmation: passConfirm.value
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

    componentDidMount: function () {
      this.state.parent.removeClass('hidden');
    },

    componentWillUnmount: function () {
      this.state.parent.addClass('hidden');
    },

    render: function () {
      return (
        <form className="register-form" onSubmit={this.submit}>
          <span className="label">Name:</span>
          <input className="name"></input>
          <span className="label">Email:</span>
          <input className="email"></input>
          <span className="label">Password:</span>
          <input className="password"></input>
          <span className="label">Confirm Password:</span>
          <input className="password-confirmation"></input>
          <input type="submit" value="Register"/>
        </form>
      );
    }
  });
})();
