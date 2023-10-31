import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    totalPoints: { type: Number, default: 20 },
    healthPoints: { type: Number, default: 0 },
    strengthPoints: { type: Number, default: 0 },
    oldHealthPoints: { type: Number, default: 0 },
    oldStrengthPoints: { type: Number, default: 0 }
  }
  static targets = ["total", "health", "strength"];

  initialize() {
    this.totalTarget.innerHTML = `Total points to spend: ${this.totalPointsValue}`;

    this.healthTarget.value = this.healthPointsValue;
    this.strengthTarget.value = this.strengthPointsValue;
  }

  getTotalPoints() {
    return this.totalPointsValue;
  }

  updateHealthPoints() {
    if (this.oldHealthPointsValue < this.healthTarget.value) {
      // when number increase
      if (this.totalPointsValue > 0) {
        this.oldHealthPointsValue = this.healthPointsValue;
        this.healthPointsValue = this.healthTarget.value;
      } else {
        this.healthTarget.value = this.healthPointsValue;
      }
    } else if (this.oldHealthPointsValue > this.healthTarget.value) {
      // when number decrease
      if (this.totalPointsValue <= 20) {
        this.oldHealthPointsValue = this.healthPointsValue;
        this.healthPointsValue = this.healthTarget.value;
      } else {
        this.healthTarget.value = this.healthPointsValue;
      }
    }

    this.spendPoints()
  }

  updateStrengthPoints() {
    if (this.oldStrengthPointsValue < this.strengthTarget.value) {
      // when number increase
      if (this.totalPointsValue > 0) {
        this.oldStrengthPointsValue = this.strengthPointsValue;
        this.strengthPointsValue = this.strengthTarget.value;
      } else {
        this.strengthTarget.value = this.strengthPointsValue;
      }
    } else if (this.oldStrengthPointsValue > this.strengthTarget.value) {
      // when number decrease
      if (this.totalPointsValue <= 20) {
        this.oldStrengthPointsValue = this.strengthPointsValue;
        this.strengthPointsValue = this.strengthTarget.value;
      } else {
        this.strengthTarget.value = this.strengthPointsValue;
      }
    }

    this.spendPoints()
  }

  spendPoints() {
    this.totalPointsValue = 20 - this.healthPointsValue - this.strengthPointsValue;

    this.totalTarget.innerHTML = `Total points to spend: ${this.totalPointsValue}`;

  }
}