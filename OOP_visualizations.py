import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt


class Graph:
    def __init__(self):
        pass

    def g_lineplot_tiempo(self, df, var_mes, xa, ya, huea):
        plt.figure(figsize=(12,4))

        # Define month order
        orden_meses = ["Enero","Febrero","Marzo","Abril","Mayo","Junio",
                    "Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]

        # Convert object column to categorical column and order the categories
        df[var_mes] = pd.Categorical(
            df[var_mes],
            categories=orden_meses,
            ordered=True
        )


        style = {
        "axes.spines.top": False,
        "axes.spines.right": False,
        "axes.grid": True,
        "grid.linestyle": "--",
        "grid.alpha": 0.5,
        "font.family": "sans-serif"
        }

        sns.set_theme(style="ticks", rc=style)
        sns.set_context("talk", font_scale=0.85)

        palette_premium = ["#1e3a8a", "#0d9488", "#e11d48", "#64748b"]
        sns.set_palette(sns.color_palette(palette_premium))

        sns.lineplot(
            data=df,
            x=xa,
            y=ya,
            hue=huea
        )

        plt.xlabel('Periodo (años)')
        plt.legend(title='Años')
        plt.ylabel('Total ventas')

        plt.xticks(rotation=45)
        plt.show()