(function () {
  var Eventer = BUS2.Eventer;

  BUS2.ContributeStartForm = React.createClass({
    getInitialState: function () {
      this.setEvents();

      return {
        className: 'contribute-start-form hidden',
        parent: $('.contribute-start-form-container')
      }
    },

    setEvents: function () {
      var that = this;

      Eventer.on('contributeClick', function () {
        that.toggleVisibility();
      });
    },

    toggleVisibility: function () {
      var isHidden = (/hidden/).test(this.state.className);

      if (isHidden) {
        this.setState({className: 'contribute-start-form'});
        this.state.parent.removeClass('hidden');
      }

      if (!isHidden) {
        this.setState({className: 'contribute-start-form hidden'});
        this.state.parent.addClass('hidden');
      }
    },

    render: function () {
      return (
        <div className={this.state.className}>
          <div>
            <span className="main-label">Informe sua posição e ajude outros usuários</span>
            <span className="location"></span>
          </div>
          <div>
            <input className="busline" placeholder="Selecione uma linha"></input>
          </div>
          <button className="start-contribute-button">
            Começar
          </button>
        </div>
      )
    }
  });
})();
