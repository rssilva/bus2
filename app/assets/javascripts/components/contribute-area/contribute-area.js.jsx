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
          <span className="label">Contribute</span>
        </div>
      </div>
    )
  }
});
