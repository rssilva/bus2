var ContributeArea = React.createClass({
  onClick: function () {

  },

  render: function () {
    return (
      <div className="contribute-area">
        <button className="contribute-button" onClick={this.onClick} >
          <span className="label">Contribute</span>
        </button>
      </div>
    )
  }
});
