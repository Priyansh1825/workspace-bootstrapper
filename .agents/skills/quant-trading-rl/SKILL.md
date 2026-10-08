---
name: quant-trading-rl
description: Quantitative finance guidelines, Technical Indicators, Backtesting, Risk Management, Position Sizing, and Gymnasium Reinforcement Learning (PPO, DQN, Policy Gradient).
---

# Quantitative Trading & Reinforcement Learning Skill

Apply this skill when working on trading strategies, algorithmic bots, backtesting engines, or reinforcement learning environments (`Trading Bot`, `strategic_rl_project`, `tactical_physics_engine`).

## 1. Quantitative Indicators & Signal Generation
* **Signal Construction:** Combine trend-following (EMA 9/21/50, Supertrend) with momentum (RSI 14, MACD) and volatility metrics (ATR, Bollinger Bands).
* **Lookahead Bias Prevention:** Never compute indicators using future data (`shift(-1)`). Always compute features strictly using data available at timestamp $t-1$.
* **Data Sanitization:** Handle missing OHLCV candles, remove volume spikes on non-trading holidays, and normalize return series using Log Returns ($\ln(P_t / P_{t-1})$) or z-scores.

## 2. Risk Management & Execution Rules (Non-Negotiable)
* **Max Risk Per Trade:** Never risk more than 1% to 2% of total portfolio equity on a single position.
* **Dynamic Position Sizing:** Calculate order quantity based on ATR or Stop-Loss distance:
  $$\text{Position Size} = \frac{\text{Account Capital} \times \text{Risk \%}}{|\text{Entry Price} - \text{Stop Loss Price}|}$$
* **Performance Metrics:** Always compute and display:
  * **Sharpe Ratio** (annualized) and **Sortino Ratio**.
  * **Maximum Drawdown (MDD)** and **Win Rate / Profit Factor**.

## 3. Gymnasium Reinforcement Learning Design
* **Observation Space:** Use normalized feature matrices (past $N$ candles of OHLCV + technical indicators + current portfolio balance).
* **Action Space:** Discrete (0: Hold, 1: Buy, 2: Sell) or Continuous (Position weight from -1.0 to +1.0).
* **Reward Shaping:** Reward differential Sharpe ratio, log returns minus transaction fees, or penalized drawdowns. Avoid sparse terminal rewards.
