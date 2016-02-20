BUS2.ContributeArea = React.createClass({
  onClick: function () {

  },

  render: function () {
    return (
      <div className="contribute-area">
        <button className="contribute-button" onClick={this.onClick} >
          <svg className="contribute-bus">
            <use xlinkHref="#contribute-bus"></use>
          </svg>
          <span className="label">Contribute</span>
        </button>
      </div>
    )
  }
});
