(function () {
  var Eventer = BUS2.Eventer;

  BUS2.ContributeStartForm = React.createClass({
    getInitialState: function () {
      this.setEvents();

      return {
        className: 'contribute-start-form',
        parent: $('.contribute-start-form-container'),
        busLine: ''
      }
    },

    setEvents: function () {
      var that = this;

      Eventer.on('contributeClick', function () {
        // that.toggleVisibility();
      });
    },

    onStartClick: function () {
      Eventer.trigger('contributeStartClick', {busLine: this.state.busLine});
    },

    onBusLineChange: function (ev) {
      this.setState({busLine: ev.target.value})
    },

    componentDidMount: function () {
      this.state.parent.removeClass('hidden');
    },

    componentWillUnmount: function () {
      this.state.parent.addClass('hidden');
    },

    render: function () {
      return (
        <div className={this.state.className}>
          <div>
            <span className="main-label">Informe sua posição e ajude outros usuários</span>
            <span className="location"></span>
          </div>
          <div>
            <input className="busline" placeholder="Selecione uma linha" onChange={this.onBusLineChange}></input>
          </div>
          <button className="start-contribute-button" onClick={this.onStartClick}>
            Start
          </button>
        </div>
      )
    }
  });
})();
