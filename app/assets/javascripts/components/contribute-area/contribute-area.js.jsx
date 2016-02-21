BUS2.ContributeArea = React.createClass({
  getInitialState: function () {
    return {
      isOpen: false
    }
  },

  onClick: function () {
    // window.history.pushState({}, '', '#/contribute/set');
    window.location.hash = '#/contribute/set'
  },

  render: function () {
    return (
      <div className="contribute-area">
        <div className="contribute-button" onClick={this.onClick} >
          <button className="contribute-button" onClick={this.onClick} >
            <svg className="contribute-bus">
              <use xlinkHref="#contribute-bus"></use>
            </svg>
            <span className="label">Contribute</span>
          </button>
        </div>
      </div>
    )
  }
});
